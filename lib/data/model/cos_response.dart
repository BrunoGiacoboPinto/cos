import 'package:freezed_annotation/freezed_annotation.dart';

part 'cos_response.freezed.dart';
part 'cost_response.g.dart';

@freezed
abstract class CosResponseChoiches with _$CosResponseChoiches {
  const factory CosResponseChoiches({
    required String make,
    required String model,
    required String externalId,
    required int similarity,
  }) = _CosResponseChoiches;

  factory CosResponseChoiches.fromJson(Map<String, Object?> json) => _$CosResponseChoichesFromJson(json);
}

@freezed
abstract class CosResponseData with _$CosResponseData {
  const factory CosResponseData({
    required String id,
    required String feedback,
    required String valuatedAt,
    required String requestedAt,
    required String updatedAt,
    required String make,
    required String model,
    required String externalId,
    required @JsonKey(name: '_fk_sellerUser') String fkSellerUser,
    required int price,
    required bool positiveCustomerFeedback,
    required @JsonKey(name: '_fk_uuid_auction') String fkUuidAuction,
    required String inspectorRequestedAt,
    required String origin,
    required String estimationRequestId,
    required int similarity,
  }) = _CosResponseData;

  factory CosResponseData.fromJson(Map<String, Object?> json) => _$CosResponseDataFromJson(json);
}