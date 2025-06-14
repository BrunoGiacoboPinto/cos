import 'dart:convert';

import 'package:cos/config/environment.dart';
import 'package:cos/data/model/cos_response.dart';
import 'package:http/http.dart';

abstract interface class CosService {
  Future<CosResponse> getData();
}

final class CosServiceImpl implements CosService {
  CosServiceImpl(this._httpClient);

  final BaseClient _httpClient;

  @override
  Future<CosResponse> getData() async {
    final response = await _httpClient.get(Environment.baseUrl);

    return switch (response.statusCode) {
      200 => CosResponseWithData.fromJson(jsonDecode(response.body) as Map<String, Object?>),
      300 => CosResponseWithChoices.fromJson(jsonDecode(response.body) as Map<String, Object?>),
      _ => CosResponseWithError.fromJson(jsonDecode(response.body) as Map<String, Object?>),
    };
  }
}
