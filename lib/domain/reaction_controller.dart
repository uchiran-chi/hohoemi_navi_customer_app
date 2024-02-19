import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hohoemi_navi_customer_app/domain/reaction/reaction.dart';

import '../data/api_service.dart';


final reactionProvider = StateNotifierProvider<ReactionState,List<Reaction>>((ref) => ReactionState());

class ReactionState extends StateNotifier<List<Reaction>>{
  ReactionState(): super([]);

  Future<void> getReactionState(int userId) async {
    state = await getReactions(userId);
  }
}