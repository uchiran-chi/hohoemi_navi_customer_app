import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/api_service.dart' as api;

final userProvider =
    StateNotifierProvider<UserState, api.User?>((ref) => UserState());

class UserState extends StateNotifier<api.User?> {
  UserState() : super(null);

  Future<void> login(String tell, String password) async {
    try {
      final response = await api.login(tell, password);
      state = await api.getUser(response.id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> create(
      String name,
      String tell,
      String password,
      String protectedName,
      String protectedAddress,
      String protectedTell) async {
    try {
      final response = await api.createUser(
          name, tell, password, protectedName, protectedAddress, protectedTell);
      state = await api.getUser(response.id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
