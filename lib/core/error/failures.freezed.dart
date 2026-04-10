// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerError value)?  serverError,TResult Function( NetworkError value)?  networkError,TResult Function( UnexpectedError value)?  unexpectedError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case NetworkError() when networkError != null:
return networkError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerError value)  serverError,required TResult Function( NetworkError value)  networkError,required TResult Function( UnexpectedError value)  unexpectedError,}){
final _that = this;
switch (_that) {
case ServerError():
return serverError(_that);case NetworkError():
return networkError(_that);case UnexpectedError():
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerError value)?  serverError,TResult? Function( NetworkError value)?  networkError,TResult? Function( UnexpectedError value)?  unexpectedError,}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case NetworkError() when networkError != null:
return networkError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  serverError,TResult Function()?  networkError,TResult Function()?  unexpectedError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError();case NetworkError() when networkError != null:
return networkError();case UnexpectedError() when unexpectedError != null:
return unexpectedError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  serverError,required TResult Function()  networkError,required TResult Function()  unexpectedError,}) {final _that = this;
switch (_that) {
case ServerError():
return serverError();case NetworkError():
return networkError();case UnexpectedError():
return unexpectedError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  serverError,TResult? Function()?  networkError,TResult? Function()?  unexpectedError,}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError();case NetworkError() when networkError != null:
return networkError();case UnexpectedError() when unexpectedError != null:
return unexpectedError();case _:
  return null;

}
}

}

/// @nodoc


class ServerError implements Failure {
  const ServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serverError()';
}


}




/// @nodoc


class NetworkError implements Failure {
  const NetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.networkError()';
}


}




/// @nodoc


class UnexpectedError implements Failure {
  const UnexpectedError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unexpectedError()';
}


}




// dart format on
