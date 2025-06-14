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
mixin _$CarAuction {

 String get id; String get make; String get model; String get externalId; int get price; String get fkSellerUser; String get fkUuidAuction; DateTime get requestedAt; DateTime get updatedAt; bool get positiveCustomerFeedback; DateTime get inspectorRequestedAt; String get origin; String get estimationRequestId;
/// Create a copy of CarAuction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionCopyWith<CarAuction> get copyWith => _$CarAuctionCopyWithImpl<CarAuction>(this as CarAuction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuction&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.price, price) || other.price == price)&&(identical(other.fkSellerUser, fkSellerUser) || other.fkSellerUser == fkSellerUser)&&(identical(other.fkUuidAuction, fkUuidAuction) || other.fkUuidAuction == fkUuidAuction)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.positiveCustomerFeedback, positiveCustomerFeedback) || other.positiveCustomerFeedback == positiveCustomerFeedback)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,id,make,model,externalId,price,fkSellerUser,fkUuidAuction,requestedAt,updatedAt,positiveCustomerFeedback,inspectorRequestedAt,origin,estimationRequestId);

@override
String toString() {
  return 'CarAuction(id: $id, make: $make, model: $model, externalId: $externalId, price: $price, fkSellerUser: $fkSellerUser, fkUuidAuction: $fkUuidAuction, requestedAt: $requestedAt, updatedAt: $updatedAt, positiveCustomerFeedback: $positiveCustomerFeedback, inspectorRequestedAt: $inspectorRequestedAt, origin: $origin, estimationRequestId: $estimationRequestId)';
}


}

/// @nodoc
abstract mixin class $CarAuctionCopyWith<$Res>  {
  factory $CarAuctionCopyWith(CarAuction value, $Res Function(CarAuction) _then) = _$CarAuctionCopyWithImpl;
@useResult
$Res call({
 String id, String make, String model, String externalId, int price, String fkSellerUser, String fkUuidAuction, DateTime requestedAt, DateTime updatedAt, bool positiveCustomerFeedback, DateTime inspectorRequestedAt, String origin, String estimationRequestId
});




}
/// @nodoc
class _$CarAuctionCopyWithImpl<$Res>
    implements $CarAuctionCopyWith<$Res> {
  _$CarAuctionCopyWithImpl(this._self, this._then);

  final CarAuction _self;
  final $Res Function(CarAuction) _then;

/// Create a copy of CarAuction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? make = null,Object? model = null,Object? externalId = null,Object? price = null,Object? fkSellerUser = null,Object? fkUuidAuction = null,Object? requestedAt = null,Object? updatedAt = null,Object? positiveCustomerFeedback = null,Object? inspectorRequestedAt = null,Object? origin = null,Object? estimationRequestId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
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


class _CarAuction implements CarAuction {
  const _CarAuction({required this.id, required this.make, required this.model, required this.externalId, required this.price, required this.fkSellerUser, required this.fkUuidAuction, required this.requestedAt, required this.updatedAt, required this.positiveCustomerFeedback, required this.inspectorRequestedAt, required this.origin, required this.estimationRequestId});
  

@override final  String id;
@override final  String make;
@override final  String model;
@override final  String externalId;
@override final  int price;
@override final  String fkSellerUser;
@override final  String fkUuidAuction;
@override final  DateTime requestedAt;
@override final  DateTime updatedAt;
@override final  bool positiveCustomerFeedback;
@override final  DateTime inspectorRequestedAt;
@override final  String origin;
@override final  String estimationRequestId;

/// Create a copy of CarAuction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarAuctionCopyWith<_CarAuction> get copyWith => __$CarAuctionCopyWithImpl<_CarAuction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarAuction&&(identical(other.id, id) || other.id == id)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.price, price) || other.price == price)&&(identical(other.fkSellerUser, fkSellerUser) || other.fkSellerUser == fkSellerUser)&&(identical(other.fkUuidAuction, fkUuidAuction) || other.fkUuidAuction == fkUuidAuction)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.positiveCustomerFeedback, positiveCustomerFeedback) || other.positiveCustomerFeedback == positiveCustomerFeedback)&&(identical(other.inspectorRequestedAt, inspectorRequestedAt) || other.inspectorRequestedAt == inspectorRequestedAt)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.estimationRequestId, estimationRequestId) || other.estimationRequestId == estimationRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,id,make,model,externalId,price,fkSellerUser,fkUuidAuction,requestedAt,updatedAt,positiveCustomerFeedback,inspectorRequestedAt,origin,estimationRequestId);

@override
String toString() {
  return 'CarAuction(id: $id, make: $make, model: $model, externalId: $externalId, price: $price, fkSellerUser: $fkSellerUser, fkUuidAuction: $fkUuidAuction, requestedAt: $requestedAt, updatedAt: $updatedAt, positiveCustomerFeedback: $positiveCustomerFeedback, inspectorRequestedAt: $inspectorRequestedAt, origin: $origin, estimationRequestId: $estimationRequestId)';
}


}

/// @nodoc
abstract mixin class _$CarAuctionCopyWith<$Res> implements $CarAuctionCopyWith<$Res> {
  factory _$CarAuctionCopyWith(_CarAuction value, $Res Function(_CarAuction) _then) = __$CarAuctionCopyWithImpl;
@override @useResult
$Res call({
 String id, String make, String model, String externalId, int price, String fkSellerUser, String fkUuidAuction, DateTime requestedAt, DateTime updatedAt, bool positiveCustomerFeedback, DateTime inspectorRequestedAt, String origin, String estimationRequestId
});




}
/// @nodoc
class __$CarAuctionCopyWithImpl<$Res>
    implements _$CarAuctionCopyWith<$Res> {
  __$CarAuctionCopyWithImpl(this._self, this._then);

  final _CarAuction _self;
  final $Res Function(_CarAuction) _then;

/// Create a copy of CarAuction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? make = null,Object? model = null,Object? externalId = null,Object? price = null,Object? fkSellerUser = null,Object? fkUuidAuction = null,Object? requestedAt = null,Object? updatedAt = null,Object? positiveCustomerFeedback = null,Object? inspectorRequestedAt = null,Object? origin = null,Object? estimationRequestId = null,}) {
  return _then(_CarAuction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
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
mixin _$CarAuctionChoice {

 String get externalId; String get make; String get model; int get similarity;
/// Create a copy of CarAuctionChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionChoiceCopyWith<CarAuctionChoice> get copyWith => _$CarAuctionChoiceCopyWithImpl<CarAuctionChoice>(this as CarAuctionChoice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionChoice&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.similarity, similarity) || other.similarity == similarity));
}


@override
int get hashCode => Object.hash(runtimeType,externalId,make,model,similarity);

@override
String toString() {
  return 'CarAuctionChoice(externalId: $externalId, make: $make, model: $model, similarity: $similarity)';
}


}

/// @nodoc
abstract mixin class $CarAuctionChoiceCopyWith<$Res>  {
  factory $CarAuctionChoiceCopyWith(CarAuctionChoice value, $Res Function(CarAuctionChoice) _then) = _$CarAuctionChoiceCopyWithImpl;
@useResult
$Res call({
 String externalId, String make, String model, int similarity
});




}
/// @nodoc
class _$CarAuctionChoiceCopyWithImpl<$Res>
    implements $CarAuctionChoiceCopyWith<$Res> {
  _$CarAuctionChoiceCopyWithImpl(this._self, this._then);

  final CarAuctionChoice _self;
  final $Res Function(CarAuctionChoice) _then;

/// Create a copy of CarAuctionChoice
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


class _CarAuctionChoice implements CarAuctionChoice {
  const _CarAuctionChoice({required this.externalId, required this.make, required this.model, required this.similarity});
  

@override final  String externalId;
@override final  String make;
@override final  String model;
@override final  int similarity;

/// Create a copy of CarAuctionChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarAuctionChoiceCopyWith<_CarAuctionChoice> get copyWith => __$CarAuctionChoiceCopyWithImpl<_CarAuctionChoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarAuctionChoice&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.similarity, similarity) || other.similarity == similarity));
}


@override
int get hashCode => Object.hash(runtimeType,externalId,make,model,similarity);

@override
String toString() {
  return 'CarAuctionChoice(externalId: $externalId, make: $make, model: $model, similarity: $similarity)';
}


}

/// @nodoc
abstract mixin class _$CarAuctionChoiceCopyWith<$Res> implements $CarAuctionChoiceCopyWith<$Res> {
  factory _$CarAuctionChoiceCopyWith(_CarAuctionChoice value, $Res Function(_CarAuctionChoice) _then) = __$CarAuctionChoiceCopyWithImpl;
@override @useResult
$Res call({
 String externalId, String make, String model, int similarity
});




}
/// @nodoc
class __$CarAuctionChoiceCopyWithImpl<$Res>
    implements _$CarAuctionChoiceCopyWith<$Res> {
  __$CarAuctionChoiceCopyWithImpl(this._self, this._then);

  final _CarAuctionChoice _self;
  final $Res Function(_CarAuctionChoice) _then;

/// Create a copy of CarAuctionChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? externalId = null,Object? make = null,Object? model = null,Object? similarity = null,}) {
  return _then(_CarAuctionChoice(
externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CarAuctionError {

 String get message; String get id;
/// Create a copy of CarAuctionError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarAuctionErrorCopyWith<CarAuctionError> get copyWith => _$CarAuctionErrorCopyWithImpl<CarAuctionError>(this as CarAuctionError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarAuctionError&&(identical(other.message, message) || other.message == message)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,message,id);

@override
String toString() {
  return 'CarAuctionError(message: $message, id: $id)';
}


}

/// @nodoc
abstract mixin class $CarAuctionErrorCopyWith<$Res>  {
  factory $CarAuctionErrorCopyWith(CarAuctionError value, $Res Function(CarAuctionError) _then) = _$CarAuctionErrorCopyWithImpl;
@useResult
$Res call({
 String message, String id
});




}
/// @nodoc
class _$CarAuctionErrorCopyWithImpl<$Res>
    implements $CarAuctionErrorCopyWith<$Res> {
  _$CarAuctionErrorCopyWithImpl(this._self, this._then);

  final CarAuctionError _self;
  final $Res Function(CarAuctionError) _then;

/// Create a copy of CarAuctionError
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


class _CarAuctionError implements CarAuctionError {
  const _CarAuctionError({required this.message, required this.id});
  

@override final  String message;
@override final  String id;

/// Create a copy of CarAuctionError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarAuctionErrorCopyWith<_CarAuctionError> get copyWith => __$CarAuctionErrorCopyWithImpl<_CarAuctionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarAuctionError&&(identical(other.message, message) || other.message == message)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,message,id);

@override
String toString() {
  return 'CarAuctionError(message: $message, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CarAuctionErrorCopyWith<$Res> implements $CarAuctionErrorCopyWith<$Res> {
  factory _$CarAuctionErrorCopyWith(_CarAuctionError value, $Res Function(_CarAuctionError) _then) = __$CarAuctionErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, String id
});




}
/// @nodoc
class __$CarAuctionErrorCopyWithImpl<$Res>
    implements _$CarAuctionErrorCopyWith<$Res> {
  __$CarAuctionErrorCopyWithImpl(this._self, this._then);

  final _CarAuctionError _self;
  final $Res Function(_CarAuctionError) _then;

/// Create a copy of CarAuctionError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? id = null,}) {
  return _then(_CarAuctionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
