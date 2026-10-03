// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_check_in_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodayCheckInStatus {
  bool get hasCheckedIn => throw _privateConstructorUsedError;
  bool get wasSmoked => throw _privateConstructorUsedError;
  int get cravingLevel => throw _privateConstructorUsedError;
  int get notesCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodayCheckInStatusCopyWith<TodayCheckInStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayCheckInStatusCopyWith<$Res> {
  factory $TodayCheckInStatusCopyWith(
          TodayCheckInStatus value, $Res Function(TodayCheckInStatus) then) =
      _$TodayCheckInStatusCopyWithImpl<$Res, TodayCheckInStatus>;
  @useResult
  $Res call(
      {bool hasCheckedIn, bool wasSmoked, int cravingLevel, int notesCount});
}

/// @nodoc
class _$TodayCheckInStatusCopyWithImpl<$Res, $Val extends TodayCheckInStatus>
    implements $TodayCheckInStatusCopyWith<$Res> {
  _$TodayCheckInStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCheckedIn = null,
    Object? wasSmoked = null,
    Object? cravingLevel = null,
    Object? notesCount = null,
  }) {
    return _then(_value.copyWith(
      hasCheckedIn: null == hasCheckedIn
          ? _value.hasCheckedIn
          : hasCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      wasSmoked: null == wasSmoked
          ? _value.wasSmoked
          : wasSmoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cravingLevel: null == cravingLevel
          ? _value.cravingLevel
          : cravingLevel // ignore: cast_nullable_to_non_nullable
              as int,
      notesCount: null == notesCount
          ? _value.notesCount
          : notesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodayCheckInStatusImplCopyWith<$Res>
    implements $TodayCheckInStatusCopyWith<$Res> {
  factory _$$TodayCheckInStatusImplCopyWith(_$TodayCheckInStatusImpl value,
          $Res Function(_$TodayCheckInStatusImpl) then) =
      __$$TodayCheckInStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasCheckedIn, bool wasSmoked, int cravingLevel, int notesCount});
}

/// @nodoc
class __$$TodayCheckInStatusImplCopyWithImpl<$Res>
    extends _$TodayCheckInStatusCopyWithImpl<$Res, _$TodayCheckInStatusImpl>
    implements _$$TodayCheckInStatusImplCopyWith<$Res> {
  __$$TodayCheckInStatusImplCopyWithImpl(_$TodayCheckInStatusImpl _value,
      $Res Function(_$TodayCheckInStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCheckedIn = null,
    Object? wasSmoked = null,
    Object? cravingLevel = null,
    Object? notesCount = null,
  }) {
    return _then(_$TodayCheckInStatusImpl(
      hasCheckedIn: null == hasCheckedIn
          ? _value.hasCheckedIn
          : hasCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      wasSmoked: null == wasSmoked
          ? _value.wasSmoked
          : wasSmoked // ignore: cast_nullable_to_non_nullable
              as bool,
      cravingLevel: null == cravingLevel
          ? _value.cravingLevel
          : cravingLevel // ignore: cast_nullable_to_non_nullable
              as int,
      notesCount: null == notesCount
          ? _value.notesCount
          : notesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TodayCheckInStatusImpl implements _TodayCheckInStatus {
  const _$TodayCheckInStatusImpl(
      {required this.hasCheckedIn,
      required this.wasSmoked,
      required this.cravingLevel,
      required this.notesCount});

  @override
  final bool hasCheckedIn;
  @override
  final bool wasSmoked;
  @override
  final int cravingLevel;
  @override
  final int notesCount;

  @override
  String toString() {
    return 'TodayCheckInStatus(hasCheckedIn: $hasCheckedIn, wasSmoked: $wasSmoked, cravingLevel: $cravingLevel, notesCount: $notesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayCheckInStatusImpl &&
            (identical(other.hasCheckedIn, hasCheckedIn) ||
                other.hasCheckedIn == hasCheckedIn) &&
            (identical(other.wasSmoked, wasSmoked) ||
                other.wasSmoked == wasSmoked) &&
            (identical(other.cravingLevel, cravingLevel) ||
                other.cravingLevel == cravingLevel) &&
            (identical(other.notesCount, notesCount) ||
                other.notesCount == notesCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hasCheckedIn, wasSmoked, cravingLevel, notesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayCheckInStatusImplCopyWith<_$TodayCheckInStatusImpl> get copyWith =>
      __$$TodayCheckInStatusImplCopyWithImpl<_$TodayCheckInStatusImpl>(
          this, _$identity);
}

abstract class _TodayCheckInStatus implements TodayCheckInStatus {
  const factory _TodayCheckInStatus(
      {required final bool hasCheckedIn,
      required final bool wasSmoked,
      required final int cravingLevel,
      required final int notesCount}) = _$TodayCheckInStatusImpl;

  @override
  bool get hasCheckedIn;
  @override
  bool get wasSmoked;
  @override
  int get cravingLevel;
  @override
  int get notesCount;
  @override
  @JsonKey(ignore: true)
  _$$TodayCheckInStatusImplCopyWith<_$TodayCheckInStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
