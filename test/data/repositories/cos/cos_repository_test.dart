import 'package:cos/data/repositories/cos/cos_repository.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/data/model/cos_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../testing/mocks/mocks.dart';

void main() {
  late MockRemoteService remoteService;
  late MockLocalService localService;
  late MockMemoryService memoryService;
  late CosRepository repository;

  setUpAll(() {
    // Register fallback value for CarAuctionModel for mocktail's any()
    registerFallbackValue(CarAuctionModel.data(
      CarAuctionDataModel.data(
        id: 0,
        make: '',
        model: '',
        externalId: '',
        price: 0,
        fkSellerUser: '',
        fkUuidAuction: '',
        requestedAt: DateTime(2000),
        updatedAt: DateTime(2000),
        positiveCustomerFeedback: false,
        inspectorRequestedAt: DateTime(2000),
        origin: '',
        estimationRequestId: '',
      ),
    ));
  });

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

  setUp(() {
    remoteService = MockRemoteService();
    localService = MockLocalService();
    memoryService = MockMemoryService();
    when(() => memoryService.getAllData()).thenAnswer((_) async => {});
    when(() => localService.getAllData()).thenAnswer((_) async => {});
    repository = CosRepository(
      remoteService: remoteService,
      localService: localService,
      memoryCosService: memoryService,
    );
  });

  group('getAllCarAuctions', () {
    test('returns from memory if it is not empty', () async {
      when(() => memoryService.getAllData()).thenAnswer((_) async => {testKey: testModel});
      final result = await repository.getAllCarAuctions();
      expect(result, {testKey: testModel});
      verify(() => memoryService.getAllData()).called(greaterThanOrEqualTo(1));
    });

    test('returns local data if memory is empty and populates memory', () async {
      when(() => memoryService.getAllData()).thenAnswer((_) async => {});
      when(() => localService.getAllData()).thenAnswer((_) async => {testKey: testModel});
      when(() => memoryService.saveData(data: testModel, key: testKey)).thenAnswer((_) async {});
      final result = await repository.getAllCarAuctions();
      expect(result, {testKey: testModel});
      verify(() => localService.getAllData()).called(greaterThanOrEqualTo(1));
      verify(() => memoryService.saveData(data: testModel, key: testKey)).called(1);
    });

    test('returns empty map if both memory and local are empty', () async {
      when(() => memoryService.getAllData()).thenAnswer((_) async => {});
      when(() => localService.getAllData()).thenAnswer((_) async => {});
      final result = await repository.getAllCarAuctions();
      expect(result, {});
    });
  });

  group('getCarAuction', () {
    test('returns from memory if present', () async {
      when(() => memoryService.hasData(key: testKey)).thenAnswer((_) async => true);
      when(() => memoryService.getData(key: testKey)).thenAnswer((_) async => testModel);
      final result = await repository.getCarAuction(key: testKey);
      expect(result, testModel);
      verify(() => memoryService.hasData(key: testKey)).called(1);
      verify(() => memoryService.getData(key: testKey)).called(1);
      verifyNever(() => localService.hasData(key: testKey));
      verifyNever(() => remoteService.getData(key: testKey));
    });

    test('returns from local if present and populates memory', () async {
      when(() => memoryService.hasData(key: testKey)).thenAnswer((_) async => false);
      when(() => localService.hasData(key: testKey)).thenAnswer((_) async => true);
      when(() => localService.getData(key: testKey)).thenAnswer((_) async => testModel);
      when(() => memoryService.saveData(data: testModel, key: testKey)).thenAnswer((_) async {});
      final result = await repository.getCarAuction(key: testKey);
      expect(result, testModel);
      verify(() => localService.hasData(key: testKey)).called(1);
      verify(() => localService.getData(key: testKey)).called(1);
      verify(() => memoryService.saveData(data: testModel, key: testKey)).called(1);
      verifyNever(() => remoteService.getData(key: testKey));
    });

    test('fetches from remote, saves to local and memory if not found locally', () async {
      final remoteCosResponse = CosResponseWithData(
        data: CosResponseData(
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
          valuatedAt: DateTime(2024, 1, 4),
          feedback: '',
        ),
      );
      when(() => memoryService.hasData(key: testKey)).thenAnswer((_) async => false);
      when(() => localService.hasData(key: testKey)).thenAnswer((_) async => false);
      when(() => remoteService.getData(key: testKey)).thenAnswer((_) async => remoteCosResponse);
      when(() => localService.saveData(data: any(named: 'data'), key: any(named: 'key'))).thenAnswer((_) async {});
      when(() => memoryService.saveData(data: any(named: 'data'), key: any(named: 'key'))).thenAnswer((_) async {});
      final result = await repository.getCarAuction(key: testKey);
      final expectedModel = CarAuctionModel.fromResponse(remoteCosResponse);
      expect(result, expectedModel);
      verify(() => remoteService.getData(key: testKey)).called(1);
      verify(() => localService.saveData(data: expectedModel, key: testKey)).called(1);
      verify(() => memoryService.saveData(data: expectedModel, key: testKey)).called(1);
    });

    test('returns null if not found anywhere', () async {
      when(() => memoryService.hasData(key: testKey)).thenAnswer((_) async => false);
      when(() => localService.hasData(key: testKey)).thenAnswer((_) async => false);
      when(() => remoteService.getData(key: testKey)).thenAnswer((_) async => CosResponseWithError(
        error: CosResponseError(
          msgKey: 'not_found',
          message: 'Not found',
          params: CosResponseErrorParams(delaySeconds: '0'),
        ),
      ));
      final result = await repository.getCarAuction(key: testKey);
      expect(result, isA<CarAuctionWithError>());
    });
  });
} 