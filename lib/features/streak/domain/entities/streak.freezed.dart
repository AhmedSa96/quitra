// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Streak {
  int get currentCount => throw _privateConstructorUsedError;
  int get longestCount => throw _privateConstructorUsedError;
  DateTime? get lastCheckInDate => throw _privateConstructorUsedError;
  StreakMode get mode => throw _privateConstructorUsedError;
  bool get forgivenessUsedThisWeek => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreakCopyWith<Streak> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakCopyWith<$Res> {
  factory $StreakCopyWith(Streak value, $Res Function(Streak) then) =
      _$StreakCopyWithImpl<$Res, Streak>;
  @useResult
  $Res call(
      {int currentCount,
      int longestCount,
      DateTime? lastCheckInDate,
      StreakMode mode,
      bool forgivenessUsedThisWeek});
}

/// @nodoc
class _$StreakCopyWithImpl<$Res, $Val extends Streak>
    implements $StreakCopyWith<$Res> {
  _$StreakCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCount = null,
    Object? longestCount = null,
    Object? lastCheckInDate = freezed,
    Object? mode = null,
    Object? forgivenessUsedThisWeek = null,
  }) {
    return _then(_value.copyWith(
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      longestCount: null == longestCount
          ? _value.longestCount
          : longestCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckInDate: freezed == lastCheckInDate
          ? _value.lastCheckInDate
          : lastCheckInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as StreakMode,
      forgivenessUsedThisWeek: null == forgivenessUsedThisWeek
          ? _value.forgivenessUsedThisWeek
          : forgivenessUsedThisWeek // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakImplCopyWith<$Res> implements $StreakCopyWith<$Res> {
  factory _$$StreakImplCopyWith(
          _$StreakImpl value, $Res Function(_$StreakImpl) then) =
      __$$StreakImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentCount,
      int longestCount,
      DateTime? lastCheckInDate,
      StreakMode mode,
      bool forgivenessUsedThisWeek});
}

/// @nodoc
class __$$StreakImplCopyWithImpl<$Res>
    extends _$StreakCopyWithImpl<$Res, _$StreakImpl>
    implements _$$StreakImplCopyWith<$Res> {
  __$$StreakImplCopyWithImpl(
      _$StreakImpl _value, $Res Function(_$StreakImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCount = null,
    Object? longestCount = null,
    Object? lastCheckInDate = freezed,
    Object? mode = null,
    Object? forgivenessUsedThisWeek = null,
  }) {
    return _then(_$StreakImpl(
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      longestCount: null == longestCount
          ? _value.longestCount
          : longestCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckInDate: freezed == lastCheckInDate
          ? _value.lastCheckInDate
          : lastCheckInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as StreakMode,
      forgivenessUsedThisWeek: null == forgivenessUsedThisWeek
          ? _value.forgivenessUsedThisWeek
          : forgivenessUsedThisWeek // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StreakImpl implements _Streak {
  const _$StreakImpl(
      {required this.currentCount,
      required this.longestCount,
      required this.lastCheckInDate,
      required this.mode,
      this.forgivenessUsedThisWeek = false});

  @override
  final int currentCount;
  @override
  final int longestCount;
  @override
  final DateTime? lastCheckInDate;
  @override
  final StreakMode mode;
  @override
  @JsonKey()
  final bool forgivenessUsedThisWeek;

  @override
  String toString() {
    return 'Streak(currentCount: $currentCount, longestCount: $longestCount, lastCheckInDate: $lastCheckInDate, mode: $mode, forgivenessUsedThisWeek: $forgivenessUsedThisWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakImpl &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.longestCount, longestCount) ||
                other.longestCount == longestCount) &&
            (identical(other.lastCheckInDate, lastCheckInDate) ||
                other.lastCheckInDate == lastCheckInDate) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(
                    other.forgivenessUsedThisWeek, forgivenessUsedThisWeek) ||
                other.forgivenessUsedThisWeek == forgivenessUsedThisWeek));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentCount, longestCount,
      lastCheckInDate, mode, forgivenessUsedThisWeek);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakImplCopyWith<_$StreakImpl> get copyWith =>
      __$$StreakImplCopyWithImpl<_$StreakImpl>(this, _$identity);
}

abstract class _Streak implements Streak {
  const factory _Streak(
      {required final int currentCount,
      required final int longestCount,
      required final DateTime? lastCheckInDate,
      required final StreakMode mode,
      final bool forgivenessUsedThisWeek}) = _$StreakImpl;

  @override
  int get currentCount;
  @override
  int get longestCount;
  @override
  DateTime? get lastCheckInDate;
  @override
  StreakMode get mode;
  @override
  bool get forgivenessUsedThisWeek;
  @override
  @JsonKey(ignore: true)
  _$$StreakImplCopyWith<_$StreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
