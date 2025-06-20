import 'dart:async';
import 'dart:convert';

import 'package:cos/data/services/cos/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CosStorageService implements CosServiceReadWriteAccess<CarAuctionModel> {
  CosStorageService({@visibleForTesting SharedPreferencesAsync? sharedPreferences})
      : _sharedPreferences = sharedPreferences ?? SharedPreferencesAsync() {
    _allowedKeysCompleter = Completer<void>();
    _allowedKeysCompleter.complete(
      _sharedPreferences.getStringList(_kCarAuctionStorageKeys).then(
        (keys) {
          _allowedKeys.addAll(keys ?? []);
          _logger.info('Allowed keys initial load: $_allowedKeys');
        },
      ),
    );
  }

  static const String _kCarAuctionStorageKeys = 'car_auction_storage_keys';
  static final _logger = Logger('CosStorageService');

  late final SharedPreferencesAsync _sharedPreferences;
  late final Set<String> _allowedKeys = {};
  late final Completer<void> _allowedKeysCompleter;

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
      _sharedPreferences.getStringList(_kCarAuctionStorageKeys).then(
        (keys) {
          _allowedKeys.addAll([...?keys, key]);
          _logger.info('Got $key and Will save: $_allowedKeys');

          _sharedPreferences.setStringList(
            _kCarAuctionStorageKeys,
            _allowedKeys.toList(),
          );
        },
      );
    }
  }

  @override
  Future<Map<String, CarAuctionModel>> getAllData() async {
    await _allowedKeysCompleter.future;
    final keys = await _sharedPreferences.getKeys(allowList: _allowedKeys);

    return <String, CarAuctionModel>{
      for (final key in keys)
        if (await getData(key: key) case final model?) key: model,
    };
  }
}
