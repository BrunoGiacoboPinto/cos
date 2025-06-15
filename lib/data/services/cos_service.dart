import 'dart:convert';

import 'package:cos/config/environment.dart';
import 'package:cos/data/api/cos_api.dart';
import 'package:cos/data/model/cos_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

abstract interface class CosService {
  Future<CosResponse> getData();
}

final class CosServiceImpl implements CosService {
  CosServiceImpl(this._httpClient);

  final BaseClient _httpClient;

  @override
  Future<CosResponse> getData() async {
    final response = await _httpClient.get(
      Environment.baseUrl,
      headers: {
        CosChallenge.user: 'user',
      },
    );

    debugPrint('__response = ${response.body}');

    return switch (response.statusCode) {
      200 => CosResponse.data(
        data: CosResponseData.fromJson(jsonDecode(response.body) as Map<String, Object?>),
      ),
      300 => CosResponse.choices(
        choices: [...(jsonDecode(response.body) as List<Object?>).cast<Map<String, Object?>>().map(CosResponseChoiches.fromJson)],
      ),
      _ => CosResponse.error(
        error: CosResponseError.fromJson(jsonDecode(response.body) as Map<String, Object?>),
      ),
    };
  }
}
