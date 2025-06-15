// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CosResponseWithChoices _$CosResponseWithChoicesFromJson(
  Map<String, dynamic> json,
) => CosResponseWithChoices(
  choices: (json['choices'] as List<dynamic>)
      .map((e) => CosResponseChoiches.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CosResponseWithChoicesToJson(
  CosResponseWithChoices instance,
) => <String, dynamic>{
  'choices': instance.choices,
  'runtimeType': instance.$type,
};

CosResponseWithData _$CosResponseWithDataFromJson(Map<String, dynamic> json) =>
    CosResponseWithData(
      data: CosResponseData.fromJson(json['data'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CosResponseWithDataToJson(
  CosResponseWithData instance,
) => <String, dynamic>{'data': instance.data, 'runtimeType': instance.$type};

CosResponseWithError _$CosResponseWithErrorFromJson(
  Map<String, dynamic> json,
) => CosResponseWithError(
  error: CosResponseError.fromJson(json['error'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CosResponseWithErrorToJson(
  CosResponseWithError instance,
) => <String, dynamic>{'error': instance.error, 'runtimeType': instance.$type};

_CosResponseChoiches _$CosResponseChoichesFromJson(Map<String, dynamic> json) =>
    _CosResponseChoiches(
      externalId: json['externalId'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      similarity: (json['similarity'] as num).toInt(),
    );

Map<String, dynamic> _$CosResponseChoichesToJson(
  _CosResponseChoiches instance,
) => <String, dynamic>{
  'externalId': instance.externalId,
  'make': instance.make,
  'model': instance.model,
  'similarity': instance.similarity,
};

_CosResponseData _$CosResponseDataFromJson(
  Map<String, dynamic> json,
) => _CosResponseData(
  estimationRequestId: json['estimationRequestId'] as String,
  externalId: json['externalId'] as String,
  feedback: json['feedback'] as String,
  fkSellerUser: json['_fk_sellerUser'] as String,
  fkUuidAuction: json['_fk_uuid_auction'] as String,
  id: (json['id'] as num).toInt(),
  inspectorRequestedAt: const DateTimeConverter().fromJson(
    json['inspectorRequestedAt'] as String,
  ),
  make: json['make'] as String,
  model: json['model'] as String,
  origin: json['origin'] as String,
  positiveCustomerFeedback: json['positiveCustomerFeedback'] as bool,
  price: (json['price'] as num).toInt(),
  requestedAt: const DateTimeConverter().fromJson(
    json['requestedAt'] as String,
  ),
  updatedAt: const DateTimeConverter().fromJson(json['updatedAt'] as String),
  valuatedAt: const DateTimeConverter().fromJson(json['valuatedAt'] as String),
);

Map<String, dynamic> _$CosResponseDataToJson(_CosResponseData instance) =>
    <String, dynamic>{
      'estimationRequestId': instance.estimationRequestId,
      'externalId': instance.externalId,
      'feedback': instance.feedback,
      '_fk_sellerUser': instance.fkSellerUser,
      '_fk_uuid_auction': instance.fkUuidAuction,
      'id': instance.id,
      'inspectorRequestedAt': const DateTimeConverter().toJson(
        instance.inspectorRequestedAt,
      ),
      'make': instance.make,
      'model': instance.model,
      'origin': instance.origin,
      'positiveCustomerFeedback': instance.positiveCustomerFeedback,
      'price': instance.price,
      'requestedAt': const DateTimeConverter().toJson(instance.requestedAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
      'valuatedAt': const DateTimeConverter().toJson(instance.valuatedAt),
    };

_CosResponseError _$CosResponseErrorFromJson(Map<String, dynamic> json) =>
    _CosResponseError(
      msgKey: json['msgKey'] as String,
      message: json['message'] as String,
      params: CosResponseErrorParams.fromJson(
        json['params'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CosResponseErrorToJson(_CosResponseError instance) =>
    <String, dynamic>{
      'msgKey': instance.msgKey,
      'message': instance.message,
      'params': instance.params,
    };

_CosResponseErrorParams _$CosResponseErrorParamsFromJson(
  Map<String, dynamic> json,
) => _CosResponseErrorParams(delaySeconds: json['delaySeconds'] as String);

Map<String, dynamic> _$CosResponseErrorParamsToJson(
  _CosResponseErrorParams instance,
) => <String, dynamic>{'delaySeconds': instance.delaySeconds};
