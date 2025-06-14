// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cos_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CosResponse _$CosResponseFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'choices':
          return CosResponseWithChoices.fromJson(
            json
          );
                case 'data':
          return CosResponseWithData.fromJson(
            json
          );
                case 'error':
          return CosResponseWithError.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CosResponse',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CosResponse {



  /// Serializes this CosResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponse);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CosResponse()';
}


}

/// @nodoc
class $CosResponseCopyWith<$Res>  {
$CosResponseCopyWith(CosResponse _, $Res Function(CosResponse) __);
}


/// @nodoc
@JsonSerializable()

class CosResponseWithChoices implements CosResponse {
  const CosResponseWithChoices({required final  List<CosResponseChoiches> choices, final  String? $type}): _choices = choices,$type = $type ?? 'choices';
  factory CosResponseWithChoices.fromJson(Map<String, dynamic> json) => _$CosResponseWithChoicesFromJson(json);

 final  List<CosResponseChoiches> _choices;
 List<CosResponseChoiches> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseWithChoicesCopyWith<CosResponseWithChoices> get copyWith => _$CosResponseWithChoicesCopyWithImpl<CosResponseWithChoices>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseWithChoicesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseWithChoices&&const DeepCollectionEquality().equals(other._choices, _choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'CosResponse.choices(choices: $choices)';
}


}

/// @nodoc
abstract mixin class $CosResponseWithChoicesCopyWith<$Res> implements $CosResponseCopyWith<$Res> {
  factory $CosResponseWithChoicesCopyWith(CosResponseWithChoices value, $Res Function(CosResponseWithChoices) _then) = _$CosResponseWithChoicesCopyWithImpl;
@useResult
$Res call({
 List<CosResponseChoiches> choices
});




}
/// @nodoc
class _$CosResponseWithChoicesCopyWithImpl<$Res>
    implements $CosResponseWithChoicesCopyWith<$Res> {
  _$CosResponseWithChoicesCopyWithImpl(this._self, this._then);

  final CosResponseWithChoices _self;
  final $Res Function(CosResponseWithChoices) _then;

/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? choices = null,}) {
  return _then(CosResponseWithChoices(
choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<CosResponseChoiches>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CosResponseWithData implements CosResponse {
  const CosResponseWithData({required this.data, final  String? $type}): $type = $type ?? 'data';
  factory CosResponseWithData.fromJson(Map<String, dynamic> json) => _$CosResponseWithDataFromJson(json);

 final  CosResponseData data;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseWithDataCopyWith<CosResponseWithData> get copyWith => _$CosResponseWithDataCopyWithImpl<CosResponseWithData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseWithDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseWithData&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CosResponse.data(data: $data)';
}


}

/// @nodoc
abstract mixin class $CosResponseWithDataCopyWith<$Res> implements $CosResponseCopyWith<$Res> {
  factory $CosResponseWithDataCopyWith(CosResponseWithData value, $Res Function(CosResponseWithData) _then) = _$CosResponseWithDataCopyWithImpl;
@useResult
$Res call({
 CosResponseData data
});


$CosResponseDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CosResponseWithDataCopyWithImpl<$Res>
    implements $CosResponseWithDataCopyWith<$Res> {
  _$CosResponseWithDataCopyWithImpl(this._self, this._then);

  final CosResponseWithData _self;
  final $Res Function(CosResponseWithData) _then;

/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CosResponseWithData(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CosResponseData,
  ));
}

/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CosResponseDataCopyWith<$Res> get data {
  
  return $CosResponseDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class CosResponseWithError implements CosResponse {
  const CosResponseWithError({required this.error, final  String? $type}): $type = $type ?? 'error';
  factory CosResponseWithError.fromJson(Map<String, dynamic> json) => _$CosResponseWithErrorFromJson(json);

 final  CosResponseError error;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseWithErrorCopyWith<CosResponseWithError> get copyWith => _$CosResponseWithErrorCopyWithImpl<CosResponseWithError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseWithErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseWithError&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CosResponse.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CosResponseWithErrorCopyWith<$Res> implements $CosResponseCopyWith<$Res> {
  factory $CosResponseWithErrorCopyWith(CosResponseWithError value, $Res Function(CosResponseWithError) _then) = _$CosResponseWithErrorCopyWithImpl;
@useResult
$Res call({
 CosResponseError error
});


$CosResponseErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$CosResponseWithErrorCopyWithImpl<$Res>
    implements $CosResponseWithErrorCopyWith<$Res> {
  _$CosResponseWithErrorCopyWithImpl(this._self, this._then);

  final CosResponseWithError _self;
  final $Res Function(CosResponseWithError) _then;

/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CosResponseWithError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as CosResponseError,
  ));
}

/// Create a copy of CosResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CosResponseErrorCopyWith<$Res> get error {
  
  return $CosResponseErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// @nodoc
mixin _$CosResponseChoiches {

 String get externalId; String get make; String get model; int get similarity;
/// Create a copy of CosResponseChoiches
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseChoichesCopyWith<CosResponseChoiches> get copyWith => _$CosResponseChoichesCopyWithImpl<CosResponseChoiches>(this as CosResponseChoiches, _$identity);

  /// Serializes this CosResponseChoiches to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseChoiches&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.similarity, similarity) || other.similarity == similarity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalId,make,model,similarity);

@override
String toString() {
  return 'CosResponseChoiches(externalId: $externalId, make: $make, model: $model, similarity: $similarity)';
}


}

/// @nodoc
abstract mixin class $CosResponseChoichesCopyWith<$Res>  {
  factory $CosResponseChoichesCopyWith(CosResponseChoiches value, $Res Function(CosResponseChoiches) _then) = _$CosResponseChoichesCopyWithImpl;
@useResult
$Res call({
 String externalId, String make, String model, int similarity
});




}
/// @nodoc
class _$CosResponseChoichesCopyWithImpl<$Res>
    implements $CosResponseChoichesCopyWith<$Res> {
  _$CosResponseChoichesCopyWithImpl(this._self, this._then);

  final CosResponseChoiches _self;
  final $Res Function(CosResponseChoiches) _then;

/// Create a copy of CosResponseChoiches
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? externalId = null,Object? make = null,Object? model = null,Object? similarity = null,}) {
  return _then(_self.copyWith(
externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CosResponseChoiches implements CosResponseChoiches {
  const _CosResponseChoiches({required this.externalId, required this.make, required this.model, required this.similarity});
  factory _CosResponseChoiches.fromJson(Map<String, dynamic> json) => _$CosResponseChoichesFromJson(json);

@override final  String externalId;
@override final  String make;
@override final  String model;
@override final  int similarity;

/// Create a copy of CosResponseChoiches
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CosResponseChoichesCopyWith<_CosResponseChoiches> get copyWith => __$CosResponseChoichesCopyWithImpl<_CosResponseChoiches>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseChoichesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CosResponseChoiches&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.similarity, similarity) || other.similarity == similarity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalId,make,model,similarity);

@override
String toString() {
  return 'CosResponseChoiches(externalId: $externalId, make: $make, model: $model, similarity: $similarity)';
}


}

/// @nodoc
abstract mixin class _$CosResponseChoichesCopyWith<$Res> implements $CosResponseChoichesCopyWith<$Res> {
  factory _$CosResponseChoichesCopyWith(_CosResponseChoiches value, $Res Function(_CosResponseChoiches) _then) = __$CosResponseChoichesCopyWithImpl;
@override @useResult
$Res call({
 String externalId, String make, String model, int similarity
});




}
/// @nodoc
class __$CosResponseChoichesCopyWithImpl<$Res>
    implements _$CosResponseChoichesCopyWith<$Res> {
  __$CosResponseChoichesCopyWithImpl(this._self, this._then);

  final _CosResponseChoiches _self;
  final $Res Function(_CosResponseChoiches) _then;

/// Create a copy of CosResponseChoiches
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? externalId = null,Object? make = null,Object? model = null,Object? similarity = null,}) {
  return _then(_CosResponseChoiches(
externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CosResponseData {

 String get estimationRequestId; String get externalId; String get feedback; String get fkSellerUser; String get fkUuidAuction; String get id; DateTime get inspectorRequestedAt; String get make; String get model; String get origin; bool get positiveCustomerFeedback; int get price; DateTime get requestedAt; int get similarity; DateTime get updatedAt; DateTime get valuatedAt;
/// Create a copy of CosResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseDataCopyWith<CosResponseData> get copyWith => _$CosResponseDataCopyWithImpl<CosResponseData>(this as CosResponseData, _$identity);

  /// Serializes this CosResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseData&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.fkSellerUser, fkSellerUser) || other.fkSellerUser == fkSellerUser)&&(identical(other.fkUuidAuction, fkUuidAuction) || other.fkUuidAuction == fkUuidAuction)&&(identical(other.id, id) || other.id == id)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.positiveCustomerFeedback, positiveCustomerFeedback) || other.positiveCustomerFeedback == positiveCustomerFeedback)&&(identical(other.price, price) || other.price == price)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.valuatedAt, valuatedAt) || other.valuatedAt == valuatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,estimationRequestId,externalId,feedback,fkSellerUser,fkUuidAuction,id,inspectorRequestedAt,make,model,origin,positiveCustomerFeedback,price,requestedAt,similarity,updatedAt,valuatedAt);

@override
String toString() {
  return 'CosResponseData(estimationRequestId: $estimationRequestId, externalId: $externalId, feedback: $feedback, fkSellerUser: $fkSellerUser, fkUuidAuction: $fkUuidAuction, id: $id, inspectorRequestedAt: $inspectorRequestedAt, make: $make, model: $model, origin: $origin, positiveCustomerFeedback: $positiveCustomerFeedback, price: $price, requestedAt: $requestedAt, similarity: $similarity, updatedAt: $updatedAt, valuatedAt: $valuatedAt)';
}


}

/// @nodoc
abstract mixin class $CosResponseDataCopyWith<$Res>  {
  factory $CosResponseDataCopyWith(CosResponseData value, $Res Function(CosResponseData) _then) = _$CosResponseDataCopyWithImpl;
@useResult
$Res call({
 String estimationRequestId, String externalId, String feedback, String fkSellerUser, String fkUuidAuction, String id, DateTime inspectorRequestedAt, String make, String model, String origin, bool positiveCustomerFeedback, int price, DateTime requestedAt, int similarity, DateTime updatedAt, DateTime valuatedAt
});




}
/// @nodoc
class _$CosResponseDataCopyWithImpl<$Res>
    implements $CosResponseDataCopyWith<$Res> {
  _$CosResponseDataCopyWithImpl(this._self, this._then);

  final CosResponseData _self;
  final $Res Function(CosResponseData) _then;

/// Create a copy of CosResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? estimationRequestId = null,Object? externalId = null,Object? feedback = null,Object? fkSellerUser = null,Object? fkUuidAuction = null,Object? id = null,Object? inspectorRequestedAt = null,Object? make = null,Object? model = null,Object? origin = null,Object? positiveCustomerFeedback = null,Object? price = null,Object? requestedAt = null,Object? similarity = null,Object? updatedAt = null,Object? valuatedAt = null,}) {
  return _then(_self.copyWith(
estimationRequestId: null == estimationRequestId ? _self.estimationRequestId : estimationRequestId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,fkSellerUser: null == fkSellerUser ? _self.fkSellerUser : fkSellerUser // ignore: cast_nullable_to_non_nullable
as String,fkUuidAuction: null == fkUuidAuction ? _self.fkUuidAuction : fkUuidAuction // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,inspectorRequestedAt: null == inspectorRequestedAt ? _self.inspectorRequestedAt : inspectorRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,positiveCustomerFeedback: null == positiveCustomerFeedback ? _self.positiveCustomerFeedback : positiveCustomerFeedback // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,valuatedAt: null == valuatedAt ? _self.valuatedAt : valuatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()
@DateTimeConverter()
class _CosResponseData implements CosResponseData {
  const _CosResponseData({required this.estimationRequestId, required this.externalId, required this.feedback, required this.fkSellerUser, required this.fkUuidAuction, required this.id, required this.inspectorRequestedAt, required this.make, required this.model, required this.origin, required this.positiveCustomerFeedback, required this.price, required this.requestedAt, required this.similarity, required this.updatedAt, required this.valuatedAt});
  factory _CosResponseData.fromJson(Map<String, dynamic> json) => _$CosResponseDataFromJson(json);

@override final  String estimationRequestId;
@override final  String externalId;
@override final  String feedback;
@override final  String fkSellerUser;
@override final  String fkUuidAuction;
@override final  String id;
@override final  DateTime inspectorRequestedAt;
@override final  String make;
@override final  String model;
@override final  String origin;
@override final  bool positiveCustomerFeedback;
@override final  int price;
@override final  DateTime requestedAt;
@override final  int similarity;
@override final  DateTime updatedAt;
@override final  DateTime valuatedAt;

/// Create a copy of CosResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CosResponseDataCopyWith<_CosResponseData> get copyWith => __$CosResponseDataCopyWithImpl<_CosResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CosResponseData&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.fkSellerUser, fkSellerUser) || other.fkSellerUser == fkSellerUser)&&(identical(other.fkUuidAuction, fkUuidAuction) || other.fkUuidAuction == fkUuidAuction)&&(identical(other.id, id) || other.id == id)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.positiveCustomerFeedback, positiveCustomerFeedback) || other.positiveCustomerFeedback == positiveCustomerFeedback)&&(identical(other.price, price) || other.price == price)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.valuatedAt, valuatedAt) || other.valuatedAt == valuatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,estimationRequestId,externalId,feedback,fkSellerUser,fkUuidAuction,id,inspectorRequestedAt,make,model,origin,positiveCustomerFeedback,price,requestedAt,similarity,updatedAt,valuatedAt);

@override
String toString() {
  return 'CosResponseData(estimationRequestId: $estimationRequestId, externalId: $externalId, feedback: $feedback, fkSellerUser: $fkSellerUser, fkUuidAuction: $fkUuidAuction, id: $id, inspectorRequestedAt: $inspectorRequestedAt, make: $make, model: $model, origin: $origin, positiveCustomerFeedback: $positiveCustomerFeedback, price: $price, requestedAt: $requestedAt, similarity: $similarity, updatedAt: $updatedAt, valuatedAt: $valuatedAt)';
}


}

/// @nodoc
abstract mixin class _$CosResponseDataCopyWith<$Res> implements $CosResponseDataCopyWith<$Res> {
  factory _$CosResponseDataCopyWith(_CosResponseData value, $Res Function(_CosResponseData) _then) = __$CosResponseDataCopyWithImpl;
@override @useResult
$Res call({
 String estimationRequestId, String externalId, String feedback, String fkSellerUser, String fkUuidAuction, String id, DateTime inspectorRequestedAt, String make, String model, String origin, bool positiveCustomerFeedback, int price, DateTime requestedAt, int similarity, DateTime updatedAt, DateTime valuatedAt
});




}
/// @nodoc
class __$CosResponseDataCopyWithImpl<$Res>
    implements _$CosResponseDataCopyWith<$Res> {
  __$CosResponseDataCopyWithImpl(this._self, this._then);

  final _CosResponseData _self;
  final $Res Function(_CosResponseData) _then;

/// Create a copy of CosResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? estimationRequestId = null,Object? externalId = null,Object? feedback = null,Object? fkSellerUser = null,Object? fkUuidAuction = null,Object? id = null,Object? inspectorRequestedAt = null,Object? make = null,Object? model = null,Object? origin = null,Object? positiveCustomerFeedback = null,Object? price = null,Object? requestedAt = null,Object? similarity = null,Object? updatedAt = null,Object? valuatedAt = null,}) {
  return _then(_CosResponseData(
estimationRequestId: null == estimationRequestId ? _self.estimationRequestId : estimationRequestId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,fkSellerUser: null == fkSellerUser ? _self.fkSellerUser : fkSellerUser // ignore: cast_nullable_to_non_nullable
as String,fkUuidAuction: null == fkUuidAuction ? _self.fkUuidAuction : fkUuidAuction // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,inspectorRequestedAt: null == inspectorRequestedAt ? _self.inspectorRequestedAt : inspectorRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,positiveCustomerFeedback: null == positiveCustomerFeedback ? _self.positiveCustomerFeedback : positiveCustomerFeedback // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,valuatedAt: null == valuatedAt ? _self.valuatedAt : valuatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$CosResponseError {

 String get msgKey; String get message; CosResponseErrorParams get params;
/// Create a copy of CosResponseError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseErrorCopyWith<CosResponseError> get copyWith => _$CosResponseErrorCopyWithImpl<CosResponseError>(this as CosResponseError, _$identity);

  /// Serializes this CosResponseError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseError&&(identical(other.msgKey, msgKey) || other.msgKey == msgKey)&&(identical(other.message, message) || other.message == message)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,msgKey,message,params);

@override
String toString() {
  return 'CosResponseError(msgKey: $msgKey, message: $message, params: $params)';
}


}

/// @nodoc
abstract mixin class $CosResponseErrorCopyWith<$Res>  {
  factory $CosResponseErrorCopyWith(CosResponseError value, $Res Function(CosResponseError) _then) = _$CosResponseErrorCopyWithImpl;
@useResult
$Res call({
 String msgKey, String message, CosResponseErrorParams params
});


$CosResponseErrorParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$CosResponseErrorCopyWithImpl<$Res>
    implements $CosResponseErrorCopyWith<$Res> {
  _$CosResponseErrorCopyWithImpl(this._self, this._then);

  final CosResponseError _self;
  final $Res Function(CosResponseError) _then;

/// Create a copy of CosResponseError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? msgKey = null,Object? message = null,Object? params = null,}) {
  return _then(_self.copyWith(
msgKey: null == msgKey ? _self.msgKey : msgKey // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CosResponseErrorParams,
  ));
}
/// Create a copy of CosResponseError
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CosResponseErrorParamsCopyWith<$Res> get params {
  
  return $CosResponseErrorParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CosResponseError implements CosResponseError {
  const _CosResponseError({required this.msgKey, required this.message, required this.params});
  factory _CosResponseError.fromJson(Map<String, dynamic> json) => _$CosResponseErrorFromJson(json);

@override final  String msgKey;
@override final  String message;
@override final  CosResponseErrorParams params;

/// Create a copy of CosResponseError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CosResponseErrorCopyWith<_CosResponseError> get copyWith => __$CosResponseErrorCopyWithImpl<_CosResponseError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CosResponseError&&(identical(other.msgKey, msgKey) || other.msgKey == msgKey)&&(identical(other.message, message) || other.message == message)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,msgKey,message,params);

@override
String toString() {
  return 'CosResponseError(msgKey: $msgKey, message: $message, params: $params)';
}


}

/// @nodoc
abstract mixin class _$CosResponseErrorCopyWith<$Res> implements $CosResponseErrorCopyWith<$Res> {
  factory _$CosResponseErrorCopyWith(_CosResponseError value, $Res Function(_CosResponseError) _then) = __$CosResponseErrorCopyWithImpl;
@override @useResult
$Res call({
 String msgKey, String message, CosResponseErrorParams params
});


@override $CosResponseErrorParamsCopyWith<$Res> get params;

}
/// @nodoc
class __$CosResponseErrorCopyWithImpl<$Res>
    implements _$CosResponseErrorCopyWith<$Res> {
  __$CosResponseErrorCopyWithImpl(this._self, this._then);

  final _CosResponseError _self;
  final $Res Function(_CosResponseError) _then;

/// Create a copy of CosResponseError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? msgKey = null,Object? message = null,Object? params = null,}) {
  return _then(_CosResponseError(
msgKey: null == msgKey ? _self.msgKey : msgKey // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CosResponseErrorParams,
  ));
}

/// Create a copy of CosResponseError
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CosResponseErrorParamsCopyWith<$Res> get params {
  
  return $CosResponseErrorParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// @nodoc
mixin _$CosResponseErrorParams {

 String get delaySeconds;
/// Create a copy of CosResponseErrorParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CosResponseErrorParamsCopyWith<CosResponseErrorParams> get copyWith => _$CosResponseErrorParamsCopyWithImpl<CosResponseErrorParams>(this as CosResponseErrorParams, _$identity);

  /// Serializes this CosResponseErrorParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CosResponseErrorParams&&(identical(other.delaySeconds, delaySeconds) || other.delaySeconds == delaySeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,delaySeconds);

@override
String toString() {
  return 'CosResponseErrorParams(delaySeconds: $delaySeconds)';
}


}

/// @nodoc
abstract mixin class $CosResponseErrorParamsCopyWith<$Res>  {
  factory $CosResponseErrorParamsCopyWith(CosResponseErrorParams value, $Res Function(CosResponseErrorParams) _then) = _$CosResponseErrorParamsCopyWithImpl;
@useResult
$Res call({
 String delaySeconds
});




}
/// @nodoc
class _$CosResponseErrorParamsCopyWithImpl<$Res>
    implements $CosResponseErrorParamsCopyWith<$Res> {
  _$CosResponseErrorParamsCopyWithImpl(this._self, this._then);

  final CosResponseErrorParams _self;
  final $Res Function(CosResponseErrorParams) _then;

/// Create a copy of CosResponseErrorParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? delaySeconds = null,}) {
  return _then(_self.copyWith(
delaySeconds: null == delaySeconds ? _self.delaySeconds : delaySeconds // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CosResponseErrorParams implements CosResponseErrorParams {
  const _CosResponseErrorParams({required this.delaySeconds});
  factory _CosResponseErrorParams.fromJson(Map<String, dynamic> json) => _$CosResponseErrorParamsFromJson(json);

@override final  String delaySeconds;

/// Create a copy of CosResponseErrorParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CosResponseErrorParamsCopyWith<_CosResponseErrorParams> get copyWith => __$CosResponseErrorParamsCopyWithImpl<_CosResponseErrorParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CosResponseErrorParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CosResponseErrorParams&&(identical(other.delaySeconds, delaySeconds) || other.delaySeconds == delaySeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,delaySeconds);

@override
String toString() {
  return 'CosResponseErrorParams(delaySeconds: $delaySeconds)';
}


}

/// @nodoc
abstract mixin class _$CosResponseErrorParamsCopyWith<$Res> implements $CosResponseErrorParamsCopyWith<$Res> {
  factory _$CosResponseErrorParamsCopyWith(_CosResponseErrorParams value, $Res Function(_CosResponseErrorParams) _then) = __$CosResponseErrorParamsCopyWithImpl;
@override @useResult
$Res call({
 String delaySeconds
});




}
/// @nodoc
class __$CosResponseErrorParamsCopyWithImpl<$Res>
    implements _$CosResponseErrorParamsCopyWith<$Res> {
  __$CosResponseErrorParamsCopyWithImpl(this._self, this._then);

  final _CosResponseErrorParams _self;
  final $Res Function(_CosResponseErrorParams) _then;

/// Create a copy of CosResponseErrorParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? delaySeconds = null,}) {
  return _then(_CosResponseErrorParams(
delaySeconds: null == delaySeconds ? _self.delaySeconds : delaySeconds // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
