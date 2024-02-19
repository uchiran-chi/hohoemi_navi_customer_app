// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReactionImpl _$$ReactionImplFromJson(Map<String, dynamic> json) =>
    _$ReactionImpl(
      id: json['id'] as int,
      userId: json['userId'] as int,
      sendAt: const DateTimeConverter().fromJson(json['sendAt'] as String),
      reaction: json['reaction'] as String? ?? '',
    );

Map<String, dynamic> _$$ReactionImplToJson(_$ReactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sendAt': const DateTimeConverter().toJson(instance.sendAt),
      'reaction': instance.reaction,
    };
