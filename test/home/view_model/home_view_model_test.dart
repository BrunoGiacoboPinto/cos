import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/data/repositories/cos/cos_repository.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/home/view_model/vni_use_case.dart';
import 'package:cos/data/model/cos_response.dart';

import '../../../testing/mocks/mocks.dart';

void main() {
  setUpAll(() {
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
    registerFallbackValue('');
    registerFallbackValue(Invocation.method(#dummy, []));
  });

  late VNIValidationUseCase vniValidationUseCase;
  late MockRemoteService remoteService;
  late MockLocalService localService;
  late MockMemoryService memoryService;
  late CosRepository repository;
  late HomeViewModel viewModel;

  setUp(() {
    vniValidationUseCase = VNIValidationUseCase();
    remoteService = MockRemoteService();
    localService = MockLocalService();
    memoryService = MockMemoryService();
    // Default stubs for all required async methods
    when(() => memoryService.getAllData()).thenAnswer((_) async => {});
    when(() => localService.getAllData()).thenAnswer((_) async => {});
    when(() => memoryService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
    when(() => localService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
    when(() => memoryService.getData(key: any(named: 'key'))).thenAnswer((_) async => null);
    when(() => localService.getData(key: any(named: 'key'))).thenAnswer((_) async => null);
    when(() => remoteService.getData(key: any(named: 'key'))).thenAnswer((_) async => CosResponseWithError(
      error: CosResponseError(
        msgKey: 'not_found',
        message: 'Not found',
        params: CosResponseErrorParams(delaySeconds: '0'),
      ),
    ));
    when(() => memoryService.saveData(data: any(named: 'data'), key: any(named: 'key'))).thenAnswer((_) async {});
    when(() => localService.saveData(data: any(named: 'data'), key: any(named: 'key'))).thenAnswer((_) async {});
    repository = CosRepository(
      remoteService: remoteService,
      localService: localService,
      memoryCosService: memoryService,
    );
    viewModel = HomeViewModel(
      vniValidationUseCase: vniValidationUseCase,
      repository: repository,
    );
  });

  group('HomeViewModel', () {
    const testKey = 'TESTVIN12345678901';
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
      // Default: memory and local return empty
      when(() => memoryService.getAllData()).thenAnswer((_) async => {});
      when(() => localService.getAllData()).thenAnswer((_) async => {});
      when(() => memoryService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
      when(() => localService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
      when(() => memoryService.getData(key: any(named: 'key'))).thenAnswer((_) async => null);
      when(() => localService.getData(key: any(named: 'key'))).thenAnswer((_) async => null);
      when(() => remoteService.getData(key: any(named: 'key'))).thenAnswer((_) async => CosResponseWithError(
        error: CosResponseError(
          msgKey: 'not_found',
          message: 'Not found',
          params: CosResponseErrorParams(delaySeconds: '0'),
        ),
      ));
      when(() => memoryService.saveData(data: any(named: 'data'), key: any(named: 'key'))).thenAnswer((_) async {});
      when(() => localService.saveData(data: any(named: 'data'), key: any(named: 'key'))).thenAnswer((_) async {});
    });

    test('initial state is HomeScreenLoading, then HomeScreenInitial after fetch', () async {
      when(() => memoryService.getAllData()).thenAnswer((_) async => {testKey: testModel});
      // Recreate viewModel to trigger initial fetch
      viewModel = HomeViewModel(
        vniValidationUseCase: vniValidationUseCase,
        repository: repository,
      );
      expect(viewModel.state, isA<HomeScreenLoading>());
      // Wait for async fetch
      await pumpEventQueue();
      expect(viewModel.state, isA<HomeScreenInitial>());
      final state = viewModel.state as HomeScreenInitial;
      expect(state.data, contains(testKey));
    });

    test('onVniChanged with invalid VIN sets HomeScreenVNIError', () {
      viewModel.onVniChanged('shortvin');
      expect(viewModel.state, isA<HomeScreenVNIError>());
      final state = viewModel.state as HomeScreenVNIError;
      expect(state.error, contains('VIN must be exactly 17 characters'));
    });

    test('onVniChanged with valid VIN sets HomeScreenVNIValid and fetches data', () async {
      // Return a valid CosResponseWithData for the VIN
      when(() => remoteService.getData(key: any(named: 'key'))).thenAnswer((_) async => CosResponseWithData(
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
      ));
      // Explicitly stub hasData for this test
      when(() => memoryService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
      when(() => localService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
      // Use a valid VIN (17 chars, valid check digit)
      final validVin = '1HGCM82633A004352';
      viewModel.onVniChanged(validVin);
      // Should be loading first
      expect(viewModel.state, isA<HomeScreenLoading>());
      await pumpEventQueue();
      // Should be valid, then loaded
      expect(viewModel.state, isA<HomeScreenCarAuctionLoaded>());
      final state = viewModel.state as HomeScreenCarAuctionLoaded;
      expect(state.data, isA<CarAuctionWithData>());
      final data = state.data as CarAuctionWithData;
      final carData = data.data as CarAuctionWithDataModel;
      expect(carData.make, 'Toyota');
      expect(carData.model, 'Corolla');
    });

    test('onVniChanged with empty VIN triggers initial fetch', () async {
      when(() => memoryService.getAllData()).thenAnswer((_) async => {testKey: testModel});
      viewModel.onVniChanged('');
      expect(viewModel.state, isA<HomeScreenLoading>());
      await pumpEventQueue();
      expect(viewModel.state, isA<HomeScreenInitial>());
    });

    test('repository error sets HomeScreenError', () async {
      // Simulate not found by returning a CosResponseWithError from remoteService
      when(() => remoteService.getData(key: any(named: 'key'))).thenAnswer((_) async => CosResponseWithError(
        error: CosResponseError(
          msgKey: 'not_found',
          message: 'Not found',
          params: CosResponseErrorParams(delaySeconds: '0'),
        ),
      ));
      // Do not stub repository.getCarAuction here
      // Explicitly stub hasData for this test
      when(() => memoryService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
      when(() => localService.hasData(key: any(named: 'key'))).thenAnswer((_) async => false);
      final validVin = '1HGCM82633A004352';
      viewModel.onVniChanged(validVin);
      expect(viewModel.state, isA<HomeScreenLoading>());
      await pumpEventQueue();
      expect(viewModel.state, isA<HomeScreenCarAuctionLoaded>());
      final state = viewModel.state as HomeScreenCarAuctionLoaded;
      expect(state.data, isA<CarAuctionWithError>());
      final errorModel = (state.data as CarAuctionWithError).error;
      expect(errorModel.message, contains('Not found'));
    });
  });
} 