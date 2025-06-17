// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_auction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarAuctionModel {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionModel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarAuctionModel()';
}


}

/// @nodoc
class $CarAuctionModelCopyWith<$Res>  {
$CarAuctionModelCopyWith(CarAuctionModel _, $Res Function(CarAuctionModel) __);
}


/// @nodoc


class CarAuctionWithData implements CarAuctionModel {
  const CarAuctionWithData(this.data);
  

 final  CarAuctionDataModel data;

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionWithDataCopyWith<CarAuctionWithData> get copyWith => _$CarAuctionWithDataCopyWithImpl<CarAuctionWithData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionWithData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CarAuctionModel.data(data: $data)';
}


}

/// @nodoc
abstract mixin class $CarAuctionWithDataCopyWith<$Res> implements $CarAuctionModelCopyWith<$Res> {
  factory $CarAuctionWithDataCopyWith(CarAuctionWithData value, $Res Function(CarAuctionWithData) _then) = _$CarAuctionWithDataCopyWithImpl;
@useResult
$Res call({
 CarAuctionDataModel data
});


$CarAuctionDataModelCopyWith<$Res> get data;

}
/// @nodoc
class _$CarAuctionWithDataCopyWithImpl<$Res>
    implements $CarAuctionWithDataCopyWith<$Res> {
  _$CarAuctionWithDataCopyWithImpl(this._self, this._then);

  final CarAuctionWithData _self;
  final $Res Function(CarAuctionWithData) _then;

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CarAuctionWithData(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CarAuctionDataModel,
  ));
}

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarAuctionDataModelCopyWith<$Res> get data {
  
  return $CarAuctionDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class CarAuctionWithChoices implements CarAuctionModel {
  const CarAuctionWithChoices(final  Set<CarAuctionChoiceModel> choices): _choices = choices;
  

 final  Set<CarAuctionChoiceModel> _choices;
 Set<CarAuctionChoiceModel> get choices {
  if (_choices is EqualUnmodifiableSetView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_choices);
}


/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionWithChoicesCopyWith<CarAuctionWithChoices> get copyWith => _$CarAuctionWithChoicesCopyWithImpl<CarAuctionWithChoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionWithChoices&&const DeepCollectionEquality().equals(other._choices, _choices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'CarAuctionModel.choices(choices: $choices)';
}


}

/// @nodoc
abstract mixin class $CarAuctionWithChoicesCopyWith<$Res> implements $CarAuctionModelCopyWith<$Res> {
  factory $CarAuctionWithChoicesCopyWith(CarAuctionWithChoices value, $Res Function(CarAuctionWithChoices) _then) = _$CarAuctionWithChoicesCopyWithImpl;
@useResult
$Res call({
 Set<CarAuctionChoiceModel> choices
});




}
/// @nodoc
class _$CarAuctionWithChoicesCopyWithImpl<$Res>
    implements $CarAuctionWithChoicesCopyWith<$Res> {
  _$CarAuctionWithChoicesCopyWithImpl(this._self, this._then);

  final CarAuctionWithChoices _self;
  final $Res Function(CarAuctionWithChoices) _then;

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? choices = null,}) {
  return _then(CarAuctionWithChoices(
null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as Set<CarAuctionChoiceModel>,
  ));
}


}

/// @nodoc


class CarAuctionWithError implements CarAuctionModel {
  const CarAuctionWithError(this.error);
  

 final  CarAuctionErrorModel error;

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionWithErrorCopyWith<CarAuctionWithError> get copyWith => _$CarAuctionWithErrorCopyWithImpl<CarAuctionWithError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionWithError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CarAuctionModel.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CarAuctionWithErrorCopyWith<$Res> implements $CarAuctionModelCopyWith<$Res> {
  factory $CarAuctionWithErrorCopyWith(CarAuctionWithError value, $Res Function(CarAuctionWithError) _then) = _$CarAuctionWithErrorCopyWithImpl;
@useResult
$Res call({
 CarAuctionErrorModel error
});


$CarAuctionErrorModelCopyWith<$Res> get error;

}
/// @nodoc
class _$CarAuctionWithErrorCopyWithImpl<$Res>
    implements $CarAuctionWithErrorCopyWith<$Res> {
  _$CarAuctionWithErrorCopyWithImpl(this._self, this._then);

  final CarAuctionWithError _self;
  final $Res Function(CarAuctionWithError) _then;

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CarAuctionWithError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as CarAuctionErrorModel,
  ));
}

/// Create a copy of CarAuctionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarAuctionErrorModelCopyWith<$Res> get error {
  
  return $CarAuctionErrorModelCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc
mixin _$CarAuctionDataModel {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionDataModel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarAuctionDataModel()';
}


}

/// @nodoc
class $CarAuctionDataModelCopyWith<$Res>  {
$CarAuctionDataModelCopyWith(CarAuctionDataModel _, $Res Function(CarAuctionDataModel) __);
}


/// @nodoc


class CarAuctionWithDataModel implements CarAuctionDataModel {
  const CarAuctionWithDataModel({required this.id, required this.make, required this.model, required this.externalId, required this.price, required this.fkSellerUser, required this.fkUuidAuction, required this.requestedAt, required this.updatedAt, required this.positiveCustomerFeedback, required this.inspectorRequestedAt, required this.origin, required this.estimationRequestId});
  

 final  int id;
 final  String make;
 final  String model;
 final  String externalId;
 final  int price;
 final  String fkSellerUser;
 final  String fkUuidAuction;
 final  DateTime requestedAt;
 final  DateTime updatedAt;
 final  bool positiveCustomerFeedback;
 final  DateTime inspectorRequestedAt;
 final  String origin;
 final  String estimationRequestId;

/// Create a copy of CarAuctionDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionWithDataModelCopyWith<CarAuctionWithDataModel> get copyWith => _$CarAuctionWithDataModelCopyWithImpl<CarAuctionWithDataModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionWithDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.price, price) || other.price == price)&&(identical(other.fkSellerUser, fkSellerUser) || other.fkSellerUser == fkSellerUser)&&(identical(other.fkUuidAuction, fkUuidAuction) || other.fkUuidAuction == fkUuidAuction)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.positiveCustomerFeedback, positiveCustomerFeedback) || other.positiveCustomerFeedback == positiveCustomerFeedback)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,id,make,model,externalId,price,fkSellerUser,fkUuidAuction,requestedAt,updatedAt,positiveCustomerFeedback,inspectorRequestedAt,origin,estimationRequestId);

@override
String toString() {
  return 'CarAuctionDataModel.data(id: $id, make: $make, model: $model, externalId: $externalId, price: $price, fkSellerUser: $fkSellerUser, fkUuidAuction: $fkUuidAuction, requestedAt: $requestedAt, updatedAt: $updatedAt, positiveCustomerFeedback: $positiveCustomerFeedback, inspectorRequestedAt: $inspectorRequestedAt, origin: $origin, estimationRequestId: $estimationRequestId)';
}


}

/// @nodoc
abstract mixin class $CarAuctionWithDataModelCopyWith<$Res> implements $CarAuctionDataModelCopyWith<$Res> {
  factory $CarAuctionWithDataModelCopyWith(CarAuctionWithDataModel value, $Res Function(CarAuctionWithDataModel) _then) = _$CarAuctionWithDataModelCopyWithImpl;
@useResult
$Res call({
 int id, String make, String model, String externalId, int price, String fkSellerUser, String fkUuidAuction, DateTime requestedAt, DateTime updatedAt, bool positiveCustomerFeedback, DateTime inspectorRequestedAt, String origin, String estimationRequestId
});




}
/// @nodoc
class _$CarAuctionWithDataModelCopyWithImpl<$Res>
    implements $CarAuctionWithDataModelCopyWith<$Res> {
  _$CarAuctionWithDataModelCopyWithImpl(this._self, this._then);

  final CarAuctionWithDataModel _self;
  final $Res Function(CarAuctionWithDataModel) _then;

/// Create a copy of CarAuctionDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? make = null,Object? model = null,Object? externalId = null,Object? price = null,Object? fkSellerUser = null,Object? fkUuidAuction = null,Object? requestedAt = null,Object? updatedAt = null,Object? positiveCustomerFeedback = null,Object? inspectorRequestedAt = null,Object? origin = null,Object? estimationRequestId = null,}) {
  return _then(CarAuctionWithDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,fkSellerUser: null == fkSellerUser ? _self.fkSellerUser : fkSellerUser // ignore: cast_nullable_to_non_nullable
as String,fkUuidAuction: null == fkUuidAuction ? _self.fkUuidAuction : fkUuidAuction // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,positiveCustomerFeedback: null == positiveCustomerFeedback ? _self.positiveCustomerFeedback : positiveCustomerFeedback // ignore: cast_nullable_to_non_nullable
as bool,inspectorRequestedAt: null == inspectorRequestedAt ? _self.inspectorRequestedAt : inspectorRequestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,estimationRequestId: null == estimationRequestId ? _self.estimationRequestId : estimationRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CarAuctionEmptyModel implements CarAuctionDataModel {
  const CarAuctionEmptyModel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionEmptyModel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarAuctionDataModel.empty()';
}


}




/// @nodoc
mixin _$CarAuctionChoiceModel {

 String get externalId; String get make; String get model; int get similarity;
/// Create a copy of CarAuctionChoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionChoiceModelCopyWith<CarAuctionChoiceModel> get copyWith => _$CarAuctionChoiceModelCopyWithImpl<CarAuctionChoiceModel>(this as CarAuctionChoiceModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionChoiceModel&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.similarity, similarity) || other.similarity == similarity));
}


@override
int get hashCode => Object.hash(runtimeType,externalId,make,model,similarity);

@override
String toString() {
  return 'CarAuctionChoiceModel(externalId: $externalId, make: $make, model: $model, similarity: $similarity)';
}


}

/// @nodoc
abstract mixin class $CarAuctionChoiceModelCopyWith<$Res>  {
  factory $CarAuctionChoiceModelCopyWith(CarAuctionChoiceModel value, $Res Function(CarAuctionChoiceModel) _then) = _$CarAuctionChoiceModelCopyWithImpl;
@useResult
$Res call({
 String externalId, String make, String model, int similarity
});




}
/// @nodoc
class _$CarAuctionChoiceModelCopyWithImpl<$Res>
    implements $CarAuctionChoiceModelCopyWith<$Res> {
  _$CarAuctionChoiceModelCopyWithImpl(this._self, this._then);

  final CarAuctionChoiceModel _self;
  final $Res Function(CarAuctionChoiceModel) _then;

/// Create a copy of CarAuctionChoiceModel
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


class _CarAuctionChoiceModel extends CarAuctionChoiceModel {
  const _CarAuctionChoiceModel({required this.externalId, required this.make, required this.model, required this.similarity}): super._();
  

@override final  String externalId;
@override final  String make;
@override final  String model;
@override final  int similarity;

/// Create a copy of CarAuctionChoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarAuctionChoiceModelCopyWith<_CarAuctionChoiceModel> get copyWith => __$CarAuctionChoiceModelCopyWithImpl<_CarAuctionChoiceModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarAuctionChoiceModel&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.similarity, similarity) || other.similarity == similarity));
}


@override
int get hashCode => Object.hash(runtimeType,externalId,make,model,similarity);

@override
String toString() {
  return 'CarAuctionChoiceModel(externalId: $externalId, make: $make, model: $model, similarity: $similarity)';
}


}

/// @nodoc
abstract mixin class _$CarAuctionChoiceModelCopyWith<$Res> implements $CarAuctionChoiceModelCopyWith<$Res> {
  factory _$CarAuctionChoiceModelCopyWith(_CarAuctionChoiceModel value, $Res Function(_CarAuctionChoiceModel) _then) = __$CarAuctionChoiceModelCopyWithImpl;
@override @useResult
$Res call({
 String externalId, String make, String model, int similarity
});




}
/// @nodoc
class __$CarAuctionChoiceModelCopyWithImpl<$Res>
    implements _$CarAuctionChoiceModelCopyWith<$Res> {
  __$CarAuctionChoiceModelCopyWithImpl(this._self, this._then);

  final _CarAuctionChoiceModel _self;
  final $Res Function(_CarAuctionChoiceModel) _then;

/// Create a copy of CarAuctionChoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? externalId = null,Object? make = null,Object? model = null,Object? similarity = null,}) {
  return _then(_CarAuctionChoiceModel(
externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CarAuctionErrorModel {

 String get message; String get id;
/// Create a copy of CarAuctionErrorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionErrorModelCopyWith<CarAuctionErrorModel> get copyWith => _$CarAuctionErrorModelCopyWithImpl<CarAuctionErrorModel>(this as CarAuctionErrorModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionErrorModel&&(identical(other.message, message) || other.message == message)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,message,id);

@override
String toString() {
  return 'CarAuctionErrorModel(message: $message, id: $id)';
}


}

/// @nodoc
abstract mixin class $CarAuctionErrorModelCopyWith<$Res>  {
  factory $CarAuctionErrorModelCopyWith(CarAuctionErrorModel value, $Res Function(CarAuctionErrorModel) _then) = _$CarAuctionErrorModelCopyWithImpl;
@useResult
$Res call({
 String message, String id
});




}
/// @nodoc
class _$CarAuctionErrorModelCopyWithImpl<$Res>
    implements $CarAuctionErrorModelCopyWith<$Res> {
  _$CarAuctionErrorModelCopyWithImpl(this._self, this._then);

  final CarAuctionErrorModel _self;
  final $Res Function(CarAuctionErrorModel) _then;

/// Create a copy of CarAuctionErrorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? id = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _CarAuctionErrorModel implements CarAuctionErrorModel {
  const _CarAuctionErrorModel({required this.message, required this.id});
  

@override final  String message;
@override final  String id;

/// Create a copy of CarAuctionErrorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarAuctionErrorModelCopyWith<_CarAuctionErrorModel> get copyWith => __$CarAuctionErrorModelCopyWithImpl<_CarAuctionErrorModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarAuctionErrorModel&&(identical(other.message, message) || other.message == message)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,message,id);

@override
String toString() {
  return 'CarAuctionErrorModel(message: $message, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CarAuctionErrorModelCopyWith<$Res> implements $CarAuctionErrorModelCopyWith<$Res> {
  factory _$CarAuctionErrorModelCopyWith(_CarAuctionErrorModel value, $Res Function(_CarAuctionErrorModel) _then) = __$CarAuctionErrorModelCopyWithImpl;
@override @useResult
$Res call({
 String message, String id
});




}
/// @nodoc
class __$CarAuctionErrorModelCopyWithImpl<$Res>
    implements _$CarAuctionErrorModelCopyWith<$Res> {
  __$CarAuctionErrorModelCopyWithImpl(this._self, this._then);

  final _CarAuctionErrorModel _self;
  final $Res Function(_CarAuctionErrorModel) _then;

/// Create a copy of CarAuctionErrorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? id = null,}) {
  return _then(_CarAuctionErrorModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
