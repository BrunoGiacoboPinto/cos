import 'package:cos/utils/date_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cos_response.freezed.dart';
part 'cos_response.g.dart';


@freezed
abstract class CosResponse with _$CosResponse {
  const factory CosResponse.choices({
    required List<CosResponseChoiches> choices,
  }) = CosResponseWithChoices;

  const factory CosResponse.data({
    required CosResponseData data,
  }) = CosResponseWithData;

  const factory CosResponse.error({
    required CosResponseError error,
  }) = CosResponseWithError;

  factory CosResponse.fromJson(Map<String, dynamic> json) =>
      _$CosResponseFromJson(json);
}


@freezed
abstract class CosResponseChoiches with _$CosResponseChoiches {
  const factory CosResponseChoiches({
    required String externalId,
    required String make,
    required String model,
    required int similarity,
  }) = _CosResponseChoiches;
  
  factory CosResponseChoiches.fromJson(Map<String, dynamic> json) =>
      _$CosResponseChoichesFromJson(json);
}

@freezed
abstract class CosResponseData with _$CosResponseData {
  @DateTimeConverter()
  const factory CosResponseData({
    required String estimationRequestId,
    required String externalId,
    required String feedback,
    required String fkSellerUser,
    required String fkUuidAuction,
    required String id,
    required DateTime inspectorRequestedAt,
    required String make,
    required String model,
    required String origin,
    required bool positiveCustomerFeedback,
    required int price,
    required DateTime requestedAt,
    required int similarity,
    required DateTime updatedAt,
    required DateTime valuatedAt,
  }) = _CosResponseData;

  factory CosResponseData.fromJson(Map<String, dynamic> json) =>
      _$CosResponseDataFromJson(json);
}

@freezed
abstract class CosResponseError with _$CosResponseError {
  const factory CosResponseError({
    required String msgKey,
    required String message,
    required CosResponseErrorParams params,
  }) = _CosResponseError;

  factory CosResponseError.fromJson(Map<String, dynamic> json) =>
      _$CosResponseErrorFromJson(json);
}

@freezed
abstract class CosResponseErrorParams with _$CosResponseErrorParams {
  const factory CosResponseErrorParams({
    required String delaySeconds,
  }) = _CosResponseErrorParams;

  factory CosResponseErrorParams.fromJson(Map<String, dynamic> json) =>
      _$CosResponseErrorParamsFromJson(json);
}
