import 'package:cos_challenge/data/model/cos_response.dart';
import 'package:cos_challenge/data/model/cos_response.dart';

final class CosService {
  CosService(this._httpClient);

  final HttpClient _httpClient;

  Future<List<CosResponseChoiches>> getCosChoiches() async {
    final response = await _httpClient.getCosChoiches();
  }

  Future<CosResponseData> getCosResponse() async {
    final response = await _httpClient.getCosResponse();
  }
}