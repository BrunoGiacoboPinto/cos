import 'dart:convert';

import 'package:cos/config/environment.dart';
import 'package:cos/data/api/cos_api.dart';
import 'package:cos/data/services/cos/cos_data_access_interface.dart';
import 'package:cos/data/model/cos_response.dart';
import 'package:http/http.dart';

final class CosRemoteService implements CosServiceAccess<CosResponse> {
  CosRemoteService(this._httpClient);

  final BaseClient _httpClient;

  @override
  Future<CosResponse> getData({String? key}) async {
    final response = await _httpClient.get(
      Environment.baseUrl,
      headers: {
        CosChallenge.user: 'user',
      },
    );

    return switch (response.statusCode) {
      200 => CosResponse.data(
        data: CosResponseData.fromJson(jsonDecode(response.body) as Map<String, Object?>),
      ),
      300 => CosResponse.choices(
        choices: [
          ...(jsonDecode(response.body) as List<Object?>).cast<Map<String, Object?>>().map(CosResponseChoiches.fromJson),
        ],
      ),
      _ => CosResponse.error(
        error: CosResponseError.fromJson(jsonDecode(response.body) as Map<String, Object?>),
      ),
    };
  }
}
