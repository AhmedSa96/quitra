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
    required TResult Function(bool wasSmoked) logCraving,
    required TResult Function(bool wasSmoked, int cravingLevel, String? note)
        saveDailyCheckIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function(bool wasSmoked)? logCraving,
    TResult? Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function(bool wasSmoked)? logCraving,
    TResult Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStats value) loadStats,
    required TResult Function(LogCraving value) logCraving,
    required TResult Function(SaveDailyCheckIn value) saveDailyCheckIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
    TResult? Function(SaveDailyCheckIn value)? saveDailyCheckIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    TResult Function(SaveDailyCheckIn value)? saveDailyCheckIn,
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
    required TResult Function(bool wasSmoked) logCraving,
    required TResult Function(bool wasSmoked, int cravingLevel, String? note)
        saveDailyCheckIn,
  }) {
    return loadStats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function(bool wasSmoked)? logCraving,
    TResult? Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
  }) {
    return loadStats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function(bool wasSmoked)? logCraving,
    TResult Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
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
    required TResult Function(SaveDailyCheckIn value) saveDailyCheckIn,
  }) {
    return loadStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
    TResult? Function(SaveDailyCheckIn value)? saveDailyCheckIn,
  }) {
    return loadStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    TResult Function(SaveDailyCheckIn value)? saveDailyCheckIn,
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
  @useResult
  $Res call({bool wasSmoked});
}

/// @nodoc
class __$$LogCravingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LogCravingImpl>
    implements _$$LogCravingImplCopyWith<$Res> {
  __$$LogCravingImplCopyWithImpl(
      _$LogCravingImpl _value, $Res Function(_$LogCravingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wasSmoked = null,
  }) {
    return _then(_$LogCravingImpl(
      wasSmoked: null == wasSmoked
          ? _value.wasSmoked
          : wasSmoked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LogCravingImpl implements LogCraving {
  const _$LogCravingImpl({required this.wasSmoked});

  @override
  final bool wasSmoked;

  @override
  String toString() {
    return 'HomeEvent.logCraving(wasSmoked: $wasSmoked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogCravingImpl &&
            (identical(other.wasSmoked, wasSmoked) ||
                other.wasSmoked == wasSmoked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wasSmoked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogCravingImplCopyWith<_$LogCravingImpl> get copyWith =>
      __$$LogCravingImplCopyWithImpl<_$LogCravingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStats,
    required TResult Function(bool wasSmoked) logCraving,
    required TResult Function(bool wasSmoked, int cravingLevel, String? note)
        saveDailyCheckIn,
  }) {
    return logCraving(wasSmoked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function(bool wasSmoked)? logCraving,
    TResult? Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
  }) {
    return logCraving?.call(wasSmoked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function(bool wasSmoked)? logCraving,
    TResult Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
    required TResult orElse(),
  }) {
    if (logCraving != null) {
      return logCraving(wasSmoked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStats value) loadStats,
    required TResult Function(LogCraving value) logCraving,
    required TResult Function(SaveDailyCheckIn value) saveDailyCheckIn,
  }) {
    return logCraving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
    TResult? Function(SaveDailyCheckIn value)? saveDailyCheckIn,
  }) {
    return logCraving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    TResult Function(SaveDailyCheckIn value)? saveDailyCheckIn,
    required TResult orElse(),
  }) {
    if (logCraving != null) {
      return logCraving(this);
    }
    return orElse();
  }
}

abstract class LogCraving implements HomeEvent {
  const factory LogCraving({required final bool wasSmoked}) = _$LogCravingImpl;

  bool get wasSmoked;
  @JsonKey(ignore: true)
  _$$LogCravingImplCopyWith<_$LogCravingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveDailyCheckInImplCopyWith<$Res> {
  factory _$$SaveDailyCheckInImplCopyWith(_$SaveDailyCheckInImpl value,
          $Res Function(_$SaveDailyCheckInImpl) then) =
      __$$SaveDailyCheckInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool wasSmoked, int cravingLevel, String? note});
}

/// @nodoc
class __$$SaveDailyCheckInImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SaveDailyCheckInImpl>
    implements _$$SaveDailyCheckInImplCopyWith<$Res> {
  __$$SaveDailyCheckInImplCopyWithImpl(_$SaveDailyCheckInImpl _value,
      $Res Function(_$SaveDailyCheckInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wasSmoked = null,
    Object? cravingLevel = null,
    Object? note = freezed,
  }) {
    return _then(_$SaveDailyCheckInImpl(
      wasSmoked: null == wasSmoked
          ? _value.wasSmoked
          : wasSmoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cravingLevel: null == cravingLevel
          ? _value.cravingLevel
          : cravingLevel // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SaveDailyCheckInImpl implements SaveDailyCheckIn {
  const _$SaveDailyCheckInImpl(
      {required this.wasSmoked, required this.cravingLevel, this.note});

  @override
  final bool wasSmoked;
  @override
  final int cravingLevel;
  @override
  final String? note;

  @override
  String toString() {
    return 'HomeEvent.saveDailyCheckIn(wasSmoked: $wasSmoked, cravingLevel: $cravingLevel, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveDailyCheckInImpl &&
            (identical(other.wasSmoked, wasSmoked) ||
                other.wasSmoked == wasSmoked) &&
            (identical(other.cravingLevel, cravingLevel) ||
                other.cravingLevel == cravingLevel) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wasSmoked, cravingLevel, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveDailyCheckInImplCopyWith<_$SaveDailyCheckInImpl> get copyWith =>
      __$$SaveDailyCheckInImplCopyWithImpl<_$SaveDailyCheckInImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStats,
    required TResult Function(bool wasSmoked) logCraving,
    required TResult Function(bool wasSmoked, int cravingLevel, String? note)
        saveDailyCheckIn,
  }) {
    return saveDailyCheckIn(wasSmoked, cravingLevel, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStats,
    TResult? Function(bool wasSmoked)? logCraving,
    TResult? Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
  }) {
    return saveDailyCheckIn?.call(wasSmoked, cravingLevel, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStats,
    TResult Function(bool wasSmoked)? logCraving,
    TResult Function(bool wasSmoked, int cravingLevel, String? note)?
        saveDailyCheckIn,
    required TResult orElse(),
  }) {
    if (saveDailyCheckIn != null) {
      return saveDailyCheckIn(wasSmoked, cravingLevel, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadStats value) loadStats,
    required TResult Function(LogCraving value) logCraving,
    required TResult Function(SaveDailyCheckIn value) saveDailyCheckIn,
  }) {
    return saveDailyCheckIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadStats value)? loadStats,
    TResult? Function(LogCraving value)? logCraving,
    TResult? Function(SaveDailyCheckIn value)? saveDailyCheckIn,
  }) {
    return saveDailyCheckIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadStats value)? loadStats,
    TResult Function(LogCraving value)? logCraving,
    TResult Function(SaveDailyCheckIn value)? saveDailyCheckIn,
    required TResult orElse(),
  }) {
    if (saveDailyCheckIn != null) {
      return saveDailyCheckIn(this);
    }
    return orElse();
  }
}

abstract class SaveDailyCheckIn implements HomeEvent {
  const factory SaveDailyCheckIn(
      {required final bool wasSmoked,
      required final int cravingLevel,
      final String? note}) = _$SaveDailyCheckInImpl;

  bool get wasSmoked;
  int get cravingLevel;
  String? get note;
  @JsonKey(ignore: true)
  _$$SaveDailyCheckInImplCopyWith<_$SaveDailyCheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
