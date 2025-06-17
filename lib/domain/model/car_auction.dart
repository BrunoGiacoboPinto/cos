import 'dart:collection';

import 'package:cos/data/model/cos_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_auction.freezed.dart';
part 'car_auction.g.dart';

@freezed
abstract class CarAuctionModel with _$CarAuctionModel {
  const factory CarAuctionModel.data(CarAuctionDataModel data) = CarAuctionWithData;
  const factory CarAuctionModel.choices(Set<CarAuctionChoiceModel> choices) = CarAuctionWithChoices;
  const factory CarAuctionModel.error(CarAuctionErrorModel error) = CarAuctionWithError;

  factory CarAuctionModel.fromJson(Map<String, Object?> json) => _$CarAuctionModelFromJson(json);

  factory CarAuctionModel.fromResponse(CosResponse response) {
    return switch (response) {
      CosResponseWithData(data: final data) => CarAuctionModel.data(CarAuctionDataModel.from(data)),
      CosResponseWithChoices(choices: final choices) => CarAuctionModel.choices(
        SplayTreeSet<CarAuctionChoiceModel>.from(
          choices.map(CarAuctionChoiceModel.from),
          (a, b) => a.compareTo(b),
        ),
      ),
      CosResponseWithError(error: final error) => CarAuctionModel.error(CarAuctionErrorModel.from(error)),
      _ => throw ArgumentError('Unsupported response type'),
    };
  }
}

@freezed
abstract class CarAuctionDataModel with _$CarAuctionDataModel {
  const factory CarAuctionDataModel.data({
    required int id,
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
  }) = CarAuctionWithDataModel;

  const factory CarAuctionDataModel.empty() = CarAuctionEmptyModel;

  factory CarAuctionDataModel.fromJson(Map<String, Object?> json) => _$CarAuctionDataModelFromJson(json);

  factory CarAuctionDataModel.from(CosResponseData data) {
    return CarAuctionDataModel.data(
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
abstract class CarAuctionChoiceModel with _$CarAuctionChoiceModel implements Comparable<CarAuctionChoiceModel> {
  const factory CarAuctionChoiceModel({
    required String externalId,
    required String make,
    required String model,
    required int similarity,
  }) = _CarAuctionChoiceModel;

  const CarAuctionChoiceModel._();

  @override
  int compareTo(CarAuctionChoiceModel other) {
    return similarity.compareTo(other.similarity);
  }

  factory CarAuctionChoiceModel.fromJson(Map<String, Object?> json) => _$CarAuctionChoiceModelFromJson(json);

  factory CarAuctionChoiceModel.from(CosResponseChoiches choice) {
    return CarAuctionChoiceModel(
      externalId: choice.externalId,
      make: choice.make,
      model: choice.model,
      similarity: choice.similarity,
    );
  }
}

@freezed
abstract class CarAuctionErrorModel with _$CarAuctionErrorModel {
  const factory CarAuctionErrorModel({
    required String message,
    required String id,
  }) = _CarAuctionErrorModel;

  factory CarAuctionErrorModel.fromJson(Map<String, Object?> json) => _$CarAuctionErrorModelFromJson(json);

  factory CarAuctionErrorModel.from(CosResponseError error) {
    return CarAuctionErrorModel(
      message: error.message,
      id: error.msgKey,
    );
  }
}
