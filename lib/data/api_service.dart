import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/reaction/reaction.dart';

Future<List<Reaction>> getReactions(int userId) async {
  try {
    DateTime now = DateTime.now();
    List<Reaction> reactionList = [];
    final response = await http.get(
      Uri.parse(
          'http://10.0.2.2:3001/api/v1/users/${userId}/reactions'
              '?from=${DateTime(now.year, now.month, 1, 0, 0, 0)}'
              '&to=${DateTime(now.year, now.month + 1, 1, 0, 0, 0).add(const Duration(days: -1))}'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List jsonResponse = await jsonDecode(response.body);

      print(jsonResponse);
      jsonResponse.forEach((reaction) {
        reactionList.add(Reaction.fromJson(reaction));
      });

      return reactionList;
    } else {
      throw Exception('Failed to load reactions');
    }
  } catch (e) {
    throw Exception('Failed to load reactions');
  }
}
