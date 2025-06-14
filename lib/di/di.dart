import 'package:cos/data/api/cos_api.dart';
import 'package:cos/data/repositories/cos_repository.dart';
import 'package:cos/data/services/cos_service.dart';
import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/home/view_model/vni_use_case.dart';
import 'package:cos/vehicle_auction/view_model/vehicle_auction_view_model.dart';
import 'package:get_it/get_it.dart';

Future<GetIt> getItInit() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<CosService>(
    () => CosServiceImpl(CosChallenge.httpClient),
  );

  getIt.registerLazySingleton<CosRepository>(() {
    return CosRepository(
      remoteService: getIt<CosService>(),
      localService: getIt<CosService>(),
    );
  });

  getIt.registerLazySingleton<VNIValidationUseCase>(() => VNIValidationUseCase());
  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(
      vniValidationUseCase: getIt<VNIValidationUseCase>(),
    ),
  );

  getIt.registerLazySingleton<VehicleAuctionViewModel>(() => VehicleAuctionViewModel());

  await getIt.allReady();

  return getIt;
}

void disposetGetIt() {
  final getIt = GetIt.instance;
  getIt.reset();
  getIt.unregister<CosService>();
  getIt.unregister<CosRepository>();
  getIt.unregister<VNIValidationUseCase>();
  getIt.unregister<HomeViewModel>();
  getIt.unregister<VehicleAuctionViewModel>();
}