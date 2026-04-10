// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {

 int get cigarettesPerDay; int get yearsSmoking; String get quitMethod; DateTime get quitStartDate;
/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingEventCopyWith<OnboardingEvent> get copyWith => _$OnboardingEventCopyWithImpl<OnboardingEvent>(this as OnboardingEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent&&(identical(other.cigarettesPerDay, cigarettesPerDay) || other.cigarettesPerDay == cigarettesPerDay)&&(identical(other.yearsSmoking, yearsSmoking) || other.yearsSmoking == yearsSmoking)&&(identical(other.quitMethod, quitMethod) || other.quitMethod == quitMethod)&&(identical(other.quitStartDate, quitStartDate) || other.quitStartDate == quitStartDate));
}


@override
int get hashCode => Object.hash(runtimeType,cigarettesPerDay,yearsSmoking,quitMethod,quitStartDate);

@override
String toString() {
  return 'OnboardingEvent(cigarettesPerDay: $cigarettesPerDay, yearsSmoking: $yearsSmoking, quitMethod: $quitMethod, quitStartDate: $quitStartDate)';
}


}

/// @nodoc
abstract mixin class $OnboardingEventCopyWith<$Res>  {
  factory $OnboardingEventCopyWith(OnboardingEvent value, $Res Function(OnboardingEvent) _then) = _$OnboardingEventCopyWithImpl;
@useResult
$Res call({
 int cigarettesPerDay, int yearsSmoking, String quitMethod, DateTime quitStartDate
});




}
/// @nodoc
class _$OnboardingEventCopyWithImpl<$Res>
    implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._self, this._then);

  final OnboardingEvent _self;
  final $Res Function(OnboardingEvent) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cigarettesPerDay = null,Object? yearsSmoking = null,Object? quitMethod = null,Object? quitStartDate = null,}) {
  return _then(_self.copyWith(
cigarettesPerDay: null == cigarettesPerDay ? _self.cigarettesPerDay : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
as int,yearsSmoking: null == yearsSmoking ? _self.yearsSmoking : yearsSmoking // ignore: cast_nullable_to_non_nullable
as int,quitMethod: null == quitMethod ? _self.quitMethod : quitMethod // ignore: cast_nullable_to_non_nullable
as String,quitStartDate: null == quitStartDate ? _self.quitStartDate : quitStartDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingStarted value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingStarted() when started != null:
return started(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingStarted value)  started,}){
final _that = this;
switch (_that) {
case OnboardingStarted():
return started(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingStarted value)?  started,}){
final _that = this;
switch (_that) {
case OnboardingStarted() when started != null:
return started(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int cigarettesPerDay,  int yearsSmoking,  String quitMethod,  DateTime quitStartDate)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingStarted() when started != null:
return started(_that.cigarettesPerDay,_that.yearsSmoking,_that.quitMethod,_that.quitStartDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int cigarettesPerDay,  int yearsSmoking,  String quitMethod,  DateTime quitStartDate)  started,}) {final _that = this;
switch (_that) {
case OnboardingStarted():
return started(_that.cigarettesPerDay,_that.yearsSmoking,_that.quitMethod,_that.quitStartDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int cigarettesPerDay,  int yearsSmoking,  String quitMethod,  DateTime quitStartDate)?  started,}) {final _that = this;
switch (_that) {
case OnboardingStarted() when started != null:
return started(_that.cigarettesPerDay,_that.yearsSmoking,_that.quitMethod,_that.quitStartDate);case _:
  return null;

}
}

}

/// @nodoc


class OnboardingStarted implements OnboardingEvent {
  const OnboardingStarted({required this.cigarettesPerDay, required this.yearsSmoking, required this.quitMethod, required this.quitStartDate});
  

@override final  int cigarettesPerDay;
@override final  int yearsSmoking;
@override final  String quitMethod;
@override final  DateTime quitStartDate;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStartedCopyWith<OnboardingStarted> get copyWith => _$OnboardingStartedCopyWithImpl<OnboardingStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingStarted&&(identical(other.cigarettesPerDay, cigarettesPerDay) || other.cigarettesPerDay == cigarettesPerDay)&&(identical(other.yearsSmoking, yearsSmoking) || other.yearsSmoking == yearsSmoking)&&(identical(other.quitMethod, quitMethod) || other.quitMethod == quitMethod)&&(identical(other.quitStartDate, quitStartDate) || other.quitStartDate == quitStartDate));
}


@override
int get hashCode => Object.hash(runtimeType,cigarettesPerDay,yearsSmoking,quitMethod,quitStartDate);

@override
String toString() {
  return 'OnboardingEvent.started(cigarettesPerDay: $cigarettesPerDay, yearsSmoking: $yearsSmoking, quitMethod: $quitMethod, quitStartDate: $quitStartDate)';
}


}

/// @nodoc
abstract mixin class $OnboardingStartedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingStartedCopyWith(OnboardingStarted value, $Res Function(OnboardingStarted) _then) = _$OnboardingStartedCopyWithImpl;
@override @useResult
$Res call({
 int cigarettesPerDay, int yearsSmoking, String quitMethod, DateTime quitStartDate
});




}
/// @nodoc
class _$OnboardingStartedCopyWithImpl<$Res>
    implements $OnboardingStartedCopyWith<$Res> {
  _$OnboardingStartedCopyWithImpl(this._self, this._then);

  final OnboardingStarted _self;
  final $Res Function(OnboardingStarted) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cigarettesPerDay = null,Object? yearsSmoking = null,Object? quitMethod = null,Object? quitStartDate = null,}) {
  return _then(OnboardingStarted(
cigarettesPerDay: null == cigarettesPerDay ? _self.cigarettesPerDay : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
as int,yearsSmoking: null == yearsSmoking ? _self.yearsSmoking : yearsSmoking // ignore: cast_nullable_to_non_nullable
as int,quitMethod: null == quitMethod ? _self.quitMethod : quitMethod // ignore: cast_nullable_to_non_nullable
as String,quitStartDate: null == quitStartDate ? _self.quitStartDate : quitStartDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$OnboardingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState()';
}


}

/// @nodoc
class $OnboardingStateCopyWith<$Res>  {
$OnboardingStateCopyWith(OnboardingState _, $Res Function(OnboardingState) __);
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingInitial value)?  initial,TResult Function( OnboardingLoading value)?  loading,TResult Function( OnboardingSuccess value)?  success,TResult Function( OnboardingError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingInitial() when initial != null:
return initial(_that);case OnboardingLoading() when loading != null:
return loading(_that);case OnboardingSuccess() when success != null:
return success(_that);case OnboardingError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingInitial value)  initial,required TResult Function( OnboardingLoading value)  loading,required TResult Function( OnboardingSuccess value)  success,required TResult Function( OnboardingError value)  error,}){
final _that = this;
switch (_that) {
case OnboardingInitial():
return initial(_that);case OnboardingLoading():
return loading(_that);case OnboardingSuccess():
return success(_that);case OnboardingError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingInitial value)?  initial,TResult? Function( OnboardingLoading value)?  loading,TResult? Function( OnboardingSuccess value)?  success,TResult? Function( OnboardingError value)?  error,}){
final _that = this;
switch (_that) {
case OnboardingInitial() when initial != null:
return initial(_that);case OnboardingLoading() when loading != null:
return loading(_that);case OnboardingSuccess() when success != null:
return success(_that);case OnboardingError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingInitial() when initial != null:
return initial();case OnboardingLoading() when loading != null:
return loading();case OnboardingSuccess() when success != null:
return success();case OnboardingError() when error != null:
return error();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case OnboardingInitial():
return initial();case OnboardingLoading():
return loading();case OnboardingSuccess():
return success();case OnboardingError():
return error();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case OnboardingInitial() when initial != null:
return initial();case OnboardingLoading() when loading != null:
return loading();case OnboardingSuccess() when success != null:
return success();case OnboardingError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class OnboardingInitial implements OnboardingState {
  const OnboardingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.initial()';
}


}




/// @nodoc


class OnboardingLoading implements OnboardingState {
  const OnboardingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.loading()';
}


}




/// @nodoc


class OnboardingSuccess implements OnboardingState {
  const OnboardingSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.success()';
}


}




/// @nodoc


class OnboardingError implements OnboardingState {
  const OnboardingError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.error()';
}


}




// dart format on
