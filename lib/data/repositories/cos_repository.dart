import 'package:cos/data/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:flutter/rendering.dart';

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
      debugPrint('__Fetching from localService, saving to memory cache for ${localData.length} entries');
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
      debugPrint('__Fetching from memory cache for key: $key');
      return await memoryCosService.getData(key: key);
    } else if (await localService.hasData(key: key)) {
      debugPrint('__Fetching from localService for key: $key');
      final data = await localService.getData(key: key);
      if (data != null) {
        await memoryCosService.saveData(data: data, key: key);
        return data;
      }
    } else {
      final response = await remoteService.getData(key: key);

      final data = CarAuctionModel.fromResponse(response);

      debugPrint('__Fetching from Remote for key: $key for (${data.runtimeType})');

      if (data is CarAuctionWithData) {
        debugPrint('__Saving from remote for key: $key');
        await localService.saveData(data: data, key: key);
        await memoryCosService.saveData(data: data, key: key);
      }

      return data;
    }

    return null;
  }
}
