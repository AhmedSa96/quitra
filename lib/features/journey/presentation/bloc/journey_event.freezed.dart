// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journey_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JourneyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)
        updateDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)?
        updateDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)?
        updateDay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadHistory value) loadHistory,
    required TResult Function(UpdateDay value) updateDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadHistory value)? loadHistory,
    TResult? Function(UpdateDay value)? updateDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadHistory value)? loadHistory,
    TResult Function(UpdateDay value)? updateDay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JourneyEventCopyWith<$Res> {
  factory $JourneyEventCopyWith(
          JourneyEvent value, $Res Function(JourneyEvent) then) =
      _$JourneyEventCopyWithImpl<$Res, JourneyEvent>;
}

/// @nodoc
class _$JourneyEventCopyWithImpl<$Res, $Val extends JourneyEvent>
    implements $JourneyEventCopyWith<$Res> {
  _$JourneyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadHistoryImplCopyWith<$Res> {
  factory _$$LoadHistoryImplCopyWith(
          _$LoadHistoryImpl value, $Res Function(_$LoadHistoryImpl) then) =
      __$$LoadHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHistoryImplCopyWithImpl<$Res>
    extends _$JourneyEventCopyWithImpl<$Res, _$LoadHistoryImpl>
    implements _$$LoadHistoryImplCopyWith<$Res> {
  __$$LoadHistoryImplCopyWithImpl(
      _$LoadHistoryImpl _value, $Res Function(_$LoadHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadHistoryImpl implements LoadHistory {
  const _$LoadHistoryImpl();

  @override
  String toString() {
    return 'JourneyEvent.loadHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)
        updateDay,
  }) {
    return loadHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)?
        updateDay,
  }) {
    return loadHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)?
        updateDay,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadHistory value) loadHistory,
    required TResult Function(UpdateDay value) updateDay,
  }) {
    return loadHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadHistory value)? loadHistory,
    TResult? Function(UpdateDay value)? updateDay,
  }) {
    return loadHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadHistory value)? loadHistory,
    TResult Function(UpdateDay value)? updateDay,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory(this);
    }
    return orElse();
  }
}

abstract class LoadHistory implements JourneyEvent {
  const factory LoadHistory() = _$LoadHistoryImpl;
}

/// @nodoc
abstract class _$$UpdateDayImplCopyWith<$Res> {
  factory _$$UpdateDayImplCopyWith(
          _$UpdateDayImpl value, $Res Function(_$UpdateDayImpl) then) =
      __$$UpdateDayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date, bool? wasSmoked, int? cravingLevel, String? note});
}

/// @nodoc
class __$$UpdateDayImplCopyWithImpl<$Res>
    extends _$JourneyEventCopyWithImpl<$Res, _$UpdateDayImpl>
    implements _$$UpdateDayImplCopyWith<$Res> {
  __$$UpdateDayImplCopyWithImpl(
      _$UpdateDayImpl _value, $Res Function(_$UpdateDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? wasSmoked = freezed,
    Object? cravingLevel = freezed,
    Object? note = freezed,
  }) {
    return _then(_$UpdateDayImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wasSmoked: freezed == wasSmoked
          ? _value.wasSmoked
          : wasSmoked // ignore: cast_nullable_to_non_nullable
              as bool?,
      cravingLevel: freezed == cravingLevel
          ? _value.cravingLevel
          : cravingLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateDayImpl implements UpdateDay {
  const _$UpdateDayImpl(
      {required this.date, this.wasSmoked, this.cravingLevel, this.note});

  @override
  final DateTime date;
  @override
  final bool? wasSmoked;
  @override
  final int? cravingLevel;
  @override
  final String? note;

  @override
  String toString() {
    return 'JourneyEvent.updateDay(date: $date, wasSmoked: $wasSmoked, cravingLevel: $cravingLevel, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wasSmoked, wasSmoked) ||
                other.wasSmoked == wasSmoked) &&
            (identical(other.cravingLevel, cravingLevel) ||
                other.cravingLevel == cravingLevel) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, wasSmoked, cravingLevel, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDayImplCopyWith<_$UpdateDayImpl> get copyWith =>
      __$$UpdateDayImplCopyWithImpl<_$UpdateDayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)
        updateDay,
  }) {
    return updateDay(date, wasSmoked, cravingLevel, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)?
        updateDay,
  }) {
    return updateDay?.call(date, wasSmoked, cravingLevel, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(
            DateTime date, bool? wasSmoked, int? cravingLevel, String? note)?
        updateDay,
    required TResult orElse(),
  }) {
    if (updateDay != null) {
      return updateDay(date, wasSmoked, cravingLevel, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadHistory value) loadHistory,
    required TResult Function(UpdateDay value) updateDay,
  }) {
    return updateDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadHistory value)? loadHistory,
    TResult? Function(UpdateDay value)? updateDay,
  }) {
    return updateDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadHistory value)? loadHistory,
    TResult Function(UpdateDay value)? updateDay,
    required TResult orElse(),
  }) {
    if (updateDay != null) {
      return updateDay(this);
    }
    return orElse();
  }
}

abstract class UpdateDay implements JourneyEvent {
  const factory UpdateDay(
      {required final DateTime date,
      final bool? wasSmoked,
      final int? cravingLevel,
      final String? note}) = _$UpdateDayImpl;

  DateTime get date;
  bool? get wasSmoked;
  int? get cravingLevel;
  String? get note;
  @JsonKey(ignore: true)
  _$$UpdateDayImplCopyWith<_$UpdateDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
