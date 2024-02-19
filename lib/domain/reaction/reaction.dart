import 'package:freezed_annotation/freezed_annotation.dart';

import '../date/datetime_converter.dart';

part 'reaction.freezed.dart';
part 'reaction.g.dart';

@freezed
class Reaction with _$Reaction {
  const factory Reaction({
    required int id,
    required int userId,
    @DateTimeConverter() required DateTime sendAt,
    @Default('') String reaction,
  }) = _Reaction;

  factory Reaction.fromJson(Map<String, dynamic> json) => _$ReactionFromJson(json);
}
