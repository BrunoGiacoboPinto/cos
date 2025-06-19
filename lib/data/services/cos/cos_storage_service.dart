import 'dart:async';
import 'dart:convert';

import 'package:cos/data/services/cos/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CosStorageService implements CosServiceReadWriteAccess<CarAuctionModel> {
  late final _sharedPreferences = SharedPreferencesAsync();

  @override
  Future<CarAuctionModel?> getData({required String key}) async {
    if (!await _sharedPreferences.containsKey(key)) {
      return null;
    }

    final data = await _sharedPreferences.getString(key);

    if (data != null) {
      return CarAuctionModel.fromJson(jsonDecode(data) as Map<String, Object?>);
    } else {
      return null;
    }
  }

  @override
  Future<bool> hasData({required String key}) async {
    return _sharedPreferences.containsKey(key);
  }

  @override
  Future<void> saveData({required CarAuctionModel data, required String key}) async {
    if (data is CarAuctionWithData) {
      await _sharedPreferences.setString(key, jsonEncode(data.toJson()));
    }
  }

  @override
  Future<Map<String, CarAuctionModel>> getAllData() async {
    final keys = await _sharedPreferences.getKeys();

    return <String, CarAuctionModel>{
      for (final key in keys)
        if (await getData(key: key) case final model?) key: model,
    };
  }
}
