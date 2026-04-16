// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journey_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JourneyDay {
  DateTime get date => throw _privateConstructorUsedError;
  JourneyStatus get status => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int? get cravingLevel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JourneyDayCopyWith<JourneyDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JourneyDayCopyWith<$Res> {
  factory $JourneyDayCopyWith(
          JourneyDay value, $Res Function(JourneyDay) then) =
      _$JourneyDayCopyWithImpl<$Res, JourneyDay>;
  @useResult
  $Res call(
      {DateTime date, JourneyStatus status, String? note, int? cravingLevel});
}

/// @nodoc
class _$JourneyDayCopyWithImpl<$Res, $Val extends JourneyDay>
    implements $JourneyDayCopyWith<$Res> {
  _$JourneyDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? status = null,
    Object? note = freezed,
    Object? cravingLevel = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JourneyStatus,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      cravingLevel: freezed == cravingLevel
          ? _value.cravingLevel
          : cravingLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JourneyDayImplCopyWith<$Res>
    implements $JourneyDayCopyWith<$Res> {
  factory _$$JourneyDayImplCopyWith(
          _$JourneyDayImpl value, $Res Function(_$JourneyDayImpl) then) =
      __$$JourneyDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date, JourneyStatus status, String? note, int? cravingLevel});
}

/// @nodoc
class __$$JourneyDayImplCopyWithImpl<$Res>
    extends _$JourneyDayCopyWithImpl<$Res, _$JourneyDayImpl>
    implements _$$JourneyDayImplCopyWith<$Res> {
  __$$JourneyDayImplCopyWithImpl(
      _$JourneyDayImpl _value, $Res Function(_$JourneyDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? status = null,
    Object? note = freezed,
    Object? cravingLevel = freezed,
  }) {
    return _then(_$JourneyDayImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JourneyStatus,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      cravingLevel: freezed == cravingLevel
          ? _value.cravingLevel
          : cravingLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$JourneyDayImpl implements _JourneyDay {
  const _$JourneyDayImpl(
      {required this.date, required this.status, this.note, this.cravingLevel});

  @override
  final DateTime date;
  @override
  final JourneyStatus status;
  @override
  final String? note;
  @override
  final int? cravingLevel;

  @override
  String toString() {
    return 'JourneyDay(date: $date, status: $status, note: $note, cravingLevel: $cravingLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JourneyDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.cravingLevel, cravingLevel) ||
                other.cravingLevel == cravingLevel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, status, note, cravingLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JourneyDayImplCopyWith<_$JourneyDayImpl> get copyWith =>
      __$$JourneyDayImplCopyWithImpl<_$JourneyDayImpl>(this, _$identity);
}

abstract class _JourneyDay implements JourneyDay {
  const factory _JourneyDay(
      {required final DateTime date,
      required final JourneyStatus status,
      final String? note,
      final int? cravingLevel}) = _$JourneyDayImpl;

  @override
  DateTime get date;
  @override
  JourneyStatus get status;
  @override
  String? get note;
  @override
  int? get cravingLevel;
  @override
  @JsonKey(ignore: true)
  _$$JourneyDayImplCopyWith<_$JourneyDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
