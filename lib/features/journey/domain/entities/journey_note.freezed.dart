// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journey_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JourneyNote {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JourneyNoteCopyWith<JourneyNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JourneyNoteCopyWith<$Res> {
  factory $JourneyNoteCopyWith(
          JourneyNote value, $Res Function(JourneyNote) then) =
      _$JourneyNoteCopyWithImpl<$Res, JourneyNote>;
  @useResult
  $Res call({int id, DateTime createdAt, String text});
}

/// @nodoc
class _$JourneyNoteCopyWithImpl<$Res, $Val extends JourneyNote>
    implements $JourneyNoteCopyWith<$Res> {
  _$JourneyNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JourneyNoteImplCopyWith<$Res>
    implements $JourneyNoteCopyWith<$Res> {
  factory _$$JourneyNoteImplCopyWith(
          _$JourneyNoteImpl value, $Res Function(_$JourneyNoteImpl) then) =
      __$$JourneyNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime createdAt, String text});
}

/// @nodoc
class __$$JourneyNoteImplCopyWithImpl<$Res>
    extends _$JourneyNoteCopyWithImpl<$Res, _$JourneyNoteImpl>
    implements _$$JourneyNoteImplCopyWith<$Res> {
  __$$JourneyNoteImplCopyWithImpl(
      _$JourneyNoteImpl _value, $Res Function(_$JourneyNoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? text = null,
  }) {
    return _then(_$JourneyNoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JourneyNoteImpl implements _JourneyNote {
  const _$JourneyNoteImpl(
      {required this.id, required this.createdAt, required this.text});

  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final String text;

  @override
  String toString() {
    return 'JourneyNote(id: $id, createdAt: $createdAt, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JourneyNoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JourneyNoteImplCopyWith<_$JourneyNoteImpl> get copyWith =>
      __$$JourneyNoteImplCopyWithImpl<_$JourneyNoteImpl>(this, _$identity);
}

abstract class _JourneyNote implements JourneyNote {
  const factory _JourneyNote(
      {required final int id,
      required final DateTime createdAt,
      required final String text}) = _$JourneyNoteImpl;

  @override
  int get id;
  @override
  DateTime get createdAt;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$JourneyNoteImplCopyWith<_$JourneyNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
