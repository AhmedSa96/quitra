// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStats,
    required TResult Function() logCraving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function()? logCraving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function()? logCraving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStats value) loadStats,
    required TResult Function(LogCraving value) logCraving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadStatsImplCopyWith<$Res> {
  factory _$$LoadStatsImplCopyWith(
          _$LoadStatsImpl value, $Res Function(_$LoadStatsImpl) then) =
      __$$LoadStatsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadStatsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadStatsImpl>
    implements _$$LoadStatsImplCopyWith<$Res> {
  __$$LoadStatsImplCopyWithImpl(
      _$LoadStatsImpl _value, $Res Function(_$LoadStatsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadStatsImpl implements LoadStats {
  const _$LoadStatsImpl();

  @override
  String toString() {
    return 'HomeEvent.loadStats()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadStatsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStats,
    required TResult Function() logCraving,
  }) {
    return loadStats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function()? logCraving,
  }) {
    return loadStats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function()? logCraving,
    required TResult orElse(),
  }) {
    if (loadStats != null) {
      return loadStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStats value) loadStats,
    required TResult Function(LogCraving value) logCraving,
  }) {
    return loadStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
  }) {
    return loadStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    required TResult orElse(),
  }) {
    if (loadStats != null) {
      return loadStats(this);
    }
    return orElse();
  }
}

abstract class LoadStats implements HomeEvent {
  const factory LoadStats() = _$LoadStatsImpl;
}

/// @nodoc
abstract class _$$LogCravingImplCopyWith<$Res> {
  factory _$$LogCravingImplCopyWith(
          _$LogCravingImpl value, $Res Function(_$LogCravingImpl) then) =
      __$$LogCravingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogCravingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LogCravingImpl>
    implements _$$LogCravingImplCopyWith<$Res> {
  __$$LogCravingImplCopyWithImpl(
      _$LogCravingImpl _value, $Res Function(_$LogCravingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogCravingImpl implements LogCraving {
  const _$LogCravingImpl();

  @override
  String toString() {
    return 'HomeEvent.logCraving()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogCravingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStats,
    required TResult Function() logCraving,
  }) {
    return logCraving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function()? logCraving,
  }) {
    return logCraving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function()? logCraving,
    required TResult orElse(),
  }) {
    if (logCraving != null) {
      return logCraving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStats value) loadStats,
    required TResult Function(LogCraving value) logCraving,
  }) {
    return logCraving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
  }) {
    return logCraving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    required TResult orElse(),
  }) {
    if (logCraving != null) {
      return logCraving(this);
    }
    return orElse();
  }
}

abstract class LogCraving implements HomeEvent {
  const factory LogCraving() = _$LogCravingImpl;
}
