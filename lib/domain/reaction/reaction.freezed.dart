// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reaction _$ReactionFromJson(Map<String, dynamic> json) {
  return _Reaction.fromJson(json);
}

/// @nodoc
mixin _$Reaction {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get sendAt => throw _privateConstructorUsedError;
  String get reaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReactionCopyWith<Reaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionCopyWith<$Res> {
  factory $ReactionCopyWith(Reaction value, $Res Function(Reaction) then) =
      _$ReactionCopyWithImpl<$Res, Reaction>;
  @useResult
  $Res call(
      {int id,
      int userId,
      @DateTimeConverter() DateTime sendAt,
      String reaction});
}

/// @nodoc
class _$ReactionCopyWithImpl<$Res, $Val extends Reaction>
    implements $ReactionCopyWith<$Res> {
  _$ReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sendAt = null,
    Object? reaction = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      sendAt: null == sendAt
          ? _value.sendAt
          : sendAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReactionImplCopyWith<$Res>
    implements $ReactionCopyWith<$Res> {
  factory _$$ReactionImplCopyWith(
          _$ReactionImpl value, $Res Function(_$ReactionImpl) then) =
      __$$ReactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      @DateTimeConverter() DateTime sendAt,
      String reaction});
}

/// @nodoc
class __$$ReactionImplCopyWithImpl<$Res>
    extends _$ReactionCopyWithImpl<$Res, _$ReactionImpl>
    implements _$$ReactionImplCopyWith<$Res> {
  __$$ReactionImplCopyWithImpl(
      _$ReactionImpl _value, $Res Function(_$ReactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sendAt = null,
    Object? reaction = null,
  }) {
    return _then(_$ReactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      sendAt: null == sendAt
          ? _value.sendAt
          : sendAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReactionImpl implements _Reaction {
  const _$ReactionImpl(
      {required this.id,
      required this.userId,
      @DateTimeConverter() required this.sendAt,
      this.reaction = ''});

  factory _$ReactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReactionImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  @DateTimeConverter()
  final DateTime sendAt;
  @override
  @JsonKey()
  final String reaction;

  @override
  String toString() {
    return 'Reaction(id: $id, userId: $userId, sendAt: $sendAt, reaction: $reaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sendAt, sendAt) || other.sendAt == sendAt) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, sendAt, reaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReactionImplCopyWith<_$ReactionImpl> get copyWith =>
      __$$ReactionImplCopyWithImpl<_$ReactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReactionImplToJson(
      this,
    );
  }
}

abstract class _Reaction implements Reaction {
  const factory _Reaction(
      {required final int id,
      required final int userId,
      @DateTimeConverter() required final DateTime sendAt,
      final String reaction}) = _$ReactionImpl;

  factory _Reaction.fromJson(Map<String, dynamic> json) =
      _$ReactionImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  @DateTimeConverter()
  DateTime get sendAt;
  @override
  String get reaction;
  @override
  @JsonKey(ignore: true)
  _$$ReactionImplCopyWith<_$ReactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
