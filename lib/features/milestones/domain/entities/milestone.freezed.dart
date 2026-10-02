// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Milestone {
  String get id => throw _privateConstructorUsedError;
  String get titleKey => throw _privateConstructorUsedError;
  String get descriptionKey => throw _privateConstructorUsedError;
  MilestoneCategory get category => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  double get threshold => throw _privateConstructorUsedError;
  bool get isUnlocked => throw _privateConstructorUsedError;
  DateTime? get unlockedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MilestoneCopyWith<Milestone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilestoneCopyWith<$Res> {
  factory $MilestoneCopyWith(Milestone value, $Res Function(Milestone) then) =
      _$MilestoneCopyWithImpl<$Res, Milestone>;
  @useResult
  $Res call(
      {String id,
      String titleKey,
      String descriptionKey,
      MilestoneCategory category,
      String iconName,
      double threshold,
      bool isUnlocked,
      DateTime? unlockedAt});
}

/// @nodoc
class _$MilestoneCopyWithImpl<$Res, $Val extends Milestone>
    implements $MilestoneCopyWith<$Res> {
  _$MilestoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? category = null,
    Object? iconName = null,
    Object? threshold = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MilestoneCategory,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MilestoneImplCopyWith<$Res>
    implements $MilestoneCopyWith<$Res> {
  factory _$$MilestoneImplCopyWith(
          _$MilestoneImpl value, $Res Function(_$MilestoneImpl) then) =
      __$$MilestoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String titleKey,
      String descriptionKey,
      MilestoneCategory category,
      String iconName,
      double threshold,
      bool isUnlocked,
      DateTime? unlockedAt});
}

/// @nodoc
class __$$MilestoneImplCopyWithImpl<$Res>
    extends _$MilestoneCopyWithImpl<$Res, _$MilestoneImpl>
    implements _$$MilestoneImplCopyWith<$Res> {
  __$$MilestoneImplCopyWithImpl(
      _$MilestoneImpl _value, $Res Function(_$MilestoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? category = null,
    Object? iconName = null,
    Object? threshold = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
  }) {
    return _then(_$MilestoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MilestoneCategory,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$MilestoneImpl implements _Milestone {
  const _$MilestoneImpl(
      {required this.id,
      required this.titleKey,
      required this.descriptionKey,
      required this.category,
      required this.iconName,
      required this.threshold,
      required this.isUnlocked,
      this.unlockedAt});

  @override
  final String id;
  @override
  final String titleKey;
  @override
  final String descriptionKey;
  @override
  final MilestoneCategory category;
  @override
  final String iconName;
  @override
  final double threshold;
  @override
  final bool isUnlocked;
  @override
  final DateTime? unlockedAt;

  @override
  String toString() {
    return 'Milestone(id: $id, titleKey: $titleKey, descriptionKey: $descriptionKey, category: $category, iconName: $iconName, threshold: $threshold, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MilestoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, titleKey, descriptionKey,
      category, iconName, threshold, isUnlocked, unlockedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MilestoneImplCopyWith<_$MilestoneImpl> get copyWith =>
      __$$MilestoneImplCopyWithImpl<_$MilestoneImpl>(this, _$identity);
}

abstract class _Milestone implements Milestone {
  const factory _Milestone(
      {required final String id,
      required final String titleKey,
      required final String descriptionKey,
      required final MilestoneCategory category,
      required final String iconName,
      required final double threshold,
      required final bool isUnlocked,
      final DateTime? unlockedAt}) = _$MilestoneImpl;

  @override
  String get id;
  @override
  String get titleKey;
  @override
  String get descriptionKey;
  @override
  MilestoneCategory get category;
  @override
  String get iconName;
  @override
  double get threshold;
  @override
  bool get isUnlocked;
  @override
  DateTime? get unlockedAt;
  @override
  @JsonKey(ignore: true)
  _$$MilestoneImplCopyWith<_$MilestoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
