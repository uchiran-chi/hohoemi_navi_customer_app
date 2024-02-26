// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReactionImpl _$$ReactionImplFromJson(Map<String, dynamic> json) =>
    _$ReactionImpl(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      sendAt: const DateTimeConverter().fromJson(json['sendat'] as String),
      reaction: json['reaction'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$$ReactionImplToJson(_$ReactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'sendat': const DateTimeConverter().toJson(instance.sendAt),
      'reaction': instance.reaction,
      'comment': instance.comment,
    };
