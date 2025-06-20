import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cos/vehicle_auction/view_model/vehicle_auction_view_model.dart';
import 'package:cos/data/repositories/cos/cos_repository.dart';
import 'package:cos/domain/model/car_auction.dart';

import '../../../testing/mocks/mocks.dart';

void main() {
  group('VehicleAuctionViewModel', () {
    late MockRemoteService remoteService;
    late MockLocalService localService;
    late MockMemoryService memoryService;
    late CosRepository repository;
    late VehicleAuctionViewModel viewModel;

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
      viewModel = VehicleAuctionViewModel(repository: repository);
    });

    final testData = <String, CarAuctionModel>{
      'VIN123': CarAuctionModel.data(
        CarAuctionDataModel.data(
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
        ),
      ),
    };

    test('initial state is VehicleAuctionScreenStateInitial', () {
      expect(viewModel.state, isA<VehicleAuctionScreenStateInitial>());
    });

    test('loadVehicleAuctionData sets state to loading then loaded on success', () async {
      when(() => memoryService.getAllData()).thenAnswer((_) async => testData);
      final states = <VehicleAuctionScreenState>[];
      viewModel.addListener(() {
        states.add(viewModel.state);
      });
      await viewModel.loadVehicleAuctionData();
      expect(states[0], isA<VehicleAuctionScreenStateLoading>());
      expect(states[1], isA<VehicleAuctionScreenStateLoaded>());
      final loadedState = states[1] as VehicleAuctionScreenStateLoaded;
      expect(loadedState.data, testData);
    });

    test('loadVehicleAuctionData sets state to error on exception', () async {
      when(() => memoryService.getAllData()).thenThrow(Exception('Failed to load'));
      final states = <VehicleAuctionScreenState>[];
      viewModel.addListener(() {
        states.add(viewModel.state);
      });
      await viewModel.loadVehicleAuctionData();
      expect(states[0], isA<VehicleAuctionScreenStateLoading>());
      expect(states[1], isA<VehicleAuctionScreenStateError>());
      final errorState = states[1] as VehicleAuctionScreenStateError;
      expect(errorState.error, contains('Exception: Failed to load'));
    });
  });
} 