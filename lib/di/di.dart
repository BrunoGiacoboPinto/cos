import 'package:cos/data/api/cos_api.dart';
import 'package:cos/data/repositories/login/login_repository.dart';
import 'package:cos/data/repositories/cos/cos_repository.dart';
import 'package:cos/data/services/cos/cos_memory_service.dart';
import 'package:cos/data/services/cos/cos_remote_service.dart';
import 'package:cos/data/services/cos/cos_storage_service.dart';
import 'package:cos/data/services/login/login_service.dart';
import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/home/view_model/vni_use_case.dart';
import 'package:cos/login/view_model/login_view_model.dart';
import 'package:cos/vehicle_auction/view_model/vehicle_auction_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

Future<GetIt> getItInit() async {
  final logger = Logger('CosAppLogger');
  final stopWatch = Stopwatch()..start();
  final getIt = GetIt.instance;

  logger.info('Initializing GetIt dependencies');

  getIt.registerLazySingleton<CosRemoteService>(
    () => CosRemoteService(CosChallenge.httpClient),
  );

  getIt.registerLazySingleton<CosStorageService>(() => CosStorageService());
  getIt.registerLazySingleton<CosMemoryService>(() => CosMemoryService());

  getIt.registerLazySingleton<CosRepository>(() {
    return CosRepository(
      remoteService: getIt<CosRemoteService>(),
      localService: getIt<CosStorageService>(),
      memoryCosService: getIt<CosMemoryService>(),
    );
  });

  getIt.registerLazySingleton<LoginService>(() => LoginService());
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(loginService: getIt<LoginService>()),
  );

  getIt.registerLazySingleton<VNIValidationUseCase>(() => VNIValidationUseCase());
  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(
      vniValidationUseCase: getIt<VNIValidationUseCase>(),
      repository: getIt<CosRepository>(),
    ),
  );

  getIt.registerLazySingleton<VehicleAuctionViewModel>(
    () => VehicleAuctionViewModel(repository: getIt<CosRepository>()),
  );

  getIt.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(loginRepository: getIt<LoginRepository>()),
  );

  await getIt.allReady();

  logger.info('Finished initializing GetIt dependencies. Time taken: ${stopWatch.elapsedMilliseconds} ms');
  return getIt;
}

void disposetGetIt() {
  final getIt = GetIt.instance;
  getIt.reset();
}
