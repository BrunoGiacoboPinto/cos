import 'package:cos/data/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';

final class CosStorageService implements CosServiceReadWriteAccess<CarAuctionModel> {
  @override
  Future<CarAuctionModel?> getData({String? key}) async {
    return null;
  }

  @override
  Future<bool> hasData({required String key}) async {
    return false;
  }

  @override
  Future<void> saveData({required CarAuctionModel data, required String key}) async {}
}
