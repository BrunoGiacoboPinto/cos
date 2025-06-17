// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarAuctionWithData _$CarAuctionWithDataFromJson(Map<String, dynamic> json) =>
    CarAuctionWithData(
      CarAuctionDataModel.fromJson(json['data'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CarAuctionWithDataToJson(CarAuctionWithData instance) =>
    <String, dynamic>{'data': instance.data, 'runtimeType': instance.$type};

CarAuctionWithChoices _$CarAuctionWithChoicesFromJson(
  Map<String, dynamic> json,
) => CarAuctionWithChoices(
  (json['choices'] as List<dynamic>)
      .map((e) => CarAuctionChoiceModel.fromJson(e as Map<String, dynamic>))
      .toSet(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CarAuctionWithChoicesToJson(
  CarAuctionWithChoices instance,
) => <String, dynamic>{
  'choices': instance.choices.toList(),
  'runtimeType': instance.$type,
};

CarAuctionWithError _$CarAuctionWithErrorFromJson(Map<String, dynamic> json) =>
    CarAuctionWithError(
      CarAuctionErrorModel.fromJson(json['error'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CarAuctionWithErrorToJson(
  CarAuctionWithError instance,
) => <String, dynamic>{'error': instance.error, 'runtimeType': instance.$type};

CarAuctionWithDataModel _$CarAuctionWithDataModelFromJson(
  Map<String, dynamic> json,
) => CarAuctionWithDataModel(
  id: (json['id'] as num).toInt(),
  make: json['make'] as String,
  model: json['model'] as String,
  externalId: json['externalId'] as String,
  price: (json['price'] as num).toInt(),
  fkSellerUser: json['fkSellerUser'] as String,
  fkUuidAuction: json['fkUuidAuction'] as String,
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  positiveCustomerFeedback: json['positiveCustomerFeedback'] as bool,
  inspectorRequestedAt: DateTime.parse(json['inspectorRequestedAt'] as String),
  origin: json['origin'] as String,
  estimationRequestId: json['estimationRequestId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CarAuctionWithDataModelToJson(
  CarAuctionWithDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'make': instance.make,
  'model': instance.model,
  'externalId': instance.externalId,
  'price': instance.price,
  'fkSellerUser': instance.fkSellerUser,
  'fkUuidAuction': instance.fkUuidAuction,
  'requestedAt': instance.requestedAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'positiveCustomerFeedback': instance.positiveCustomerFeedback,
  'inspectorRequestedAt': instance.inspectorRequestedAt.toIso8601String(),
  'origin': instance.origin,
  'estimationRequestId': instance.estimationRequestId,
  'runtimeType': instance.$type,
};

CarAuctionEmptyModel _$CarAuctionEmptyModelFromJson(
  Map<String, dynamic> json,
) => CarAuctionEmptyModel($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CarAuctionEmptyModelToJson(
  CarAuctionEmptyModel instance,
) => <String, dynamic>{'runtimeType': instance.$type};

_CarAuctionChoiceModel _$CarAuctionChoiceModelFromJson(
  Map<String, dynamic> json,
) => _CarAuctionChoiceModel(
  externalId: json['externalId'] as String,
  make: json['make'] as String,
  model: json['model'] as String,
  similarity: (json['similarity'] as num).toInt(),
);

Map<String, dynamic> _$CarAuctionChoiceModelToJson(
  _CarAuctionChoiceModel instance,
) => <String, dynamic>{
  'externalId': instance.externalId,
  'make': instance.make,
  'model': instance.model,
  'similarity': instance.similarity,
};

_CarAuctionErrorModel _$CarAuctionErrorModelFromJson(
  Map<String, dynamic> json,
) => _CarAuctionErrorModel(
  message: json['message'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$CarAuctionErrorModelToJson(
  _CarAuctionErrorModel instance,
) => <String, dynamic>{'message': instance.message, 'id': instance.id};
