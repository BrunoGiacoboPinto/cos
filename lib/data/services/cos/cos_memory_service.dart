import 'package:cos/data/services/cos/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';

final class CosMemoryService implements CosServiceReadWriteAccess<CarAuctionModel> {
  final Map<String, CarAuctionModel> _cache = {};

  @override
  Future<CarAuctionModel?> getData({String? key}) async {
    if (key == null) {
      return null;
    } else {
      return _cache[key];
    }
  }

  @override
  Future<bool> hasData({required String key}) async {
    return _cache.containsKey(key);
  }

  @override
  Future<void> saveData({required CarAuctionModel data, required String key}) async {
    _cache[key] = data;
  }
  
  @override
  Future<Map<String, CarAuctionModel>> getAllData() async => _cache;
}
