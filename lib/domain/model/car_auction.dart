import 'package:cos/data/model/cos_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_auction.freezed.dart';

@freezed
abstract class CarAuction with _$CarAuction {
  const factory CarAuction({
    required String id,
    required String make,
    required String model,
    required String externalId,
    required int price,
    required String fkSellerUser,
    required String fkUuidAuction,
    required DateTime requestedAt,
    required DateTime updatedAt,
    required bool positiveCustomerFeedback,
    required DateTime inspectorRequestedAt,
    required String origin,
    required String estimationRequestId,
  }) = _CarAuction;

  factory CarAuction.from(CosResponseData data) {
    return CarAuction(
      id: data.id,
      make: data.make,
      model: data.model,
      externalId: data.externalId,
      price: data.price,
      fkSellerUser: data.fkSellerUser,
      fkUuidAuction: data.fkUuidAuction,
      requestedAt: data.requestedAt,
      updatedAt: data.updatedAt,
      positiveCustomerFeedback: data.positiveCustomerFeedback,
      inspectorRequestedAt: data.inspectorRequestedAt,
      origin: data.origin,
      estimationRequestId: data.estimationRequestId,
    );
  }
}

@freezed
abstract class CarAuctionChoice with _$CarAuctionChoice {
  const factory CarAuctionChoice({
    required String externalId,
    required String make,
    required String model,
    required int similarity,
  }) = _CarAuctionChoice;

  factory CarAuctionChoice.from(CosResponseChoiches choice) {
    return CarAuctionChoice(
      externalId: choice.externalId,
      make: choice.make,
      model: choice.model,
      similarity: choice.similarity,
    );
  }
}

@freezed
abstract class CarAuctionError with _$CarAuctionError {
  const factory CarAuctionError({
    required String message,
    required String id,
  }) = _CarAuctionError;

  factory CarAuctionError.from(CosResponseError error) {
    return CarAuctionError(
      message: error.message,
      id: error.msgKey,
    );
  }
}