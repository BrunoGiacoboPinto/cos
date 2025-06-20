import 'dart:convert';

import 'package:cos/data/services/cos/cos_storage_service.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../testing/mocks/mocks.dart';

void main() {
  late SharedPreferencesAsyncMock sharedPreferencesMock;
  late CosStorageService storageService;

  setUp(() {
    sharedPreferencesMock = SharedPreferencesAsyncMock();
    when(() => sharedPreferencesMock.getStringList(any())).thenAnswer((_) async => <String>[]);
    storageService = CosStorageService(sharedPreferences: sharedPreferencesMock);
  });

  group('CosStorageService', () {
    const testKey = 'test_key';
    final testData = CarAuctionDataModel.data(
      id: 1,
      make: 'Toyota',
      model: 'Corolla',
      externalId: 'EXT123',
      price: 1000,
      fkSellerUser: 'seller1',
      fkUuidAuction: 'uuid-auction',
      requestedAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 2),
      positiveCustomerFeedback: true,
      inspectorRequestedAt: DateTime(2024, 1, 3),
      origin: 'DE',
      estimationRequestId: 'est-req-1',
    );

    final testModel = CarAuctionModel.data(testData);

    test('getData returns null when key does not exist', () async {
      when(() => sharedPreferencesMock.containsKey(testKey)).thenAnswer((_) async => false);
      final result = await storageService.getData(key: testKey);
      expect(result, isNull);
    });

    test('getData returns model when key exists', () async {
      final jsonString = jsonEncode(testModel.toJson());
      when(() => sharedPreferencesMock.containsKey(testKey)).thenAnswer((_) async => true);
      when(() => sharedPreferencesMock.getString(testKey)).thenAnswer((_) async => jsonString);
      final result = await storageService.getData(key: testKey);
      expect(result, isA<CarAuctionWithData>());
      expect((result as CarAuctionWithData).data, testData);
    });

    test('hasData returns true when key exists', () async {
      when(() => sharedPreferencesMock.containsKey(testKey)).thenAnswer((_) async => true);
      final result = await storageService.hasData(key: testKey);
      expect(result, isTrue);
    });

    test('hasData returns false when key does not exist', () async {
      when(() => sharedPreferencesMock.containsKey(testKey)).thenAnswer((_) async => false);
      final result = await storageService.hasData(key: testKey);
      expect(result, isFalse);
    });

    test('saveData saves data and updates allowed keys when key does not exist', () async {
      when(() => sharedPreferencesMock.setString(testKey, any())).thenAnswer((_) async => true);
      when(() => sharedPreferencesMock.getStringList(any())).thenAnswer((_) async => []);
      when(() => sharedPreferencesMock.setStringList(any(), any())).thenAnswer((_) async => true);
      await storageService.saveData(data: testModel, key: testKey);
      await pumpEventQueue();
      verify(() => sharedPreferencesMock.setString(testKey, any())).called(1);
      verify(() => sharedPreferencesMock.setStringList(any(), any())).called(1);
    });

    test('getAllData returns all stored models', () async {
      const storageKeys = ['key1', 'key2'];
      final model1 = CarAuctionModel.data(testData);
      final model2 = CarAuctionModel.data((testData as CarAuctionWithDataModel).copyWith(id: 2, externalId: 'EXT456'));
      final json1 = jsonEncode(model1.toJson());
      final json2 = jsonEncode(model2.toJson());
      when(() => sharedPreferencesMock.getStringList(any())).thenAnswer((_) async => storageKeys);
      when(() => sharedPreferencesMock.getKeys(allowList: any(named: 'allowList'))).thenAnswer((_) async => storageKeys.toSet());
      when(() => sharedPreferencesMock.getString('key1')).thenAnswer((_) async => json1);
      when(() => sharedPreferencesMock.getString('key2')).thenAnswer((_) async => json2);
      when(() => sharedPreferencesMock.containsKey(any())).thenAnswer((_) async => true);
      final result = await storageService.getAllData();
      expect(result.length, 2);
      expect((result['key1'] as CarAuctionWithData).data, testData);
      expect((result['key2'] as CarAuctionWithData).data, (testData).copyWith(id: 2, externalId: 'EXT456'));
    });
  });
} 