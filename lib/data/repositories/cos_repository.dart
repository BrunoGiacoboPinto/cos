import 'package:cos/data/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';

class CosRepository {
  CosRepository({
    required this.remoteService,
    required this.localService,
    required this.memoryCosService,
  }) {
    getAllCarAuctions();
  }

  final CosServiceAccess remoteService;
  final CosServiceReadWriteAccess<CarAuctionModel> localService;
  final CosServiceReadWriteAccess<CarAuctionModel> memoryCosService;

  Future<Map<String, CarAuctionModel>> getAllCarAuctions() async {
    final memoryData = await memoryCosService.getAllData();
    if (memoryData.isNotEmpty) {
      return memoryData;
    }

    final localData = await localService.getAllData();
    if (localData.isNotEmpty) {
      await Future.wait(
        localData.entries.map((entry) async {
          await memoryCosService.saveData(data: entry.value, key: entry.key);
        }),
      );

      return localData;
    }

    return {};
  }

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
      final response = await remoteService.getData(key: key);

      final data = CarAuctionModel.fromResponse(response);

      if (data is CarAuctionWithData) {
        await localService.saveData(data: data, key: key);
        await memoryCosService.saveData(data: data, key: key);
      }

      return data;
    }

    return null;
  }
}
