import 'package:cos/data/cos_data_access_interface.dart';
import 'package:cos/data/model/cos_response.dart';
import 'package:cos/domain/model/car_auction.dart';

class CosRepository {
  CosRepository({
    required this.remoteService,
    required this.localService,
    required this.memoryCosService,
  });

  final CosServiceAccess remoteService;
  final CosServiceReadWriteAccess<CarAuctionModel> localService;
  final CosServiceReadWriteAccess<CarAuctionModel> memoryCosService;

  Future<CarAuctionModel?> getCarAuction({required String key}) async {
    if (await memoryCosService.hasData(key: key)) {
      return await memoryCosService.getData(key: key);
    } else if (await localService.hasData(key: key)) {
      final data = await localService.getData(key: key);
      if (data != null) {
        await memoryCosService.saveData(data: data, key: key);
        return data;
      }
    } else {
      final response = await remoteService.getData();

      final data = CarAuctionModel.fromResponse(response);

      if (data is CosResponseWithData) {
        await localService.saveData(data: data, key: key);
        await memoryCosService.saveData(data: data, key: key);
      }

      return data;
    }

    return null;
  }
}
