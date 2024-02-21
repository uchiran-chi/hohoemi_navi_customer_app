import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/reaction/reaction.dart';

class LoginResponse {
  final int id;

  LoginResponse({required this.id});

  // ファクトリメソッド
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
    );
  }
}

class CreateUserResponse {
  final int id;

  CreateUserResponse({required this.id});

  // ファクトリメソッド
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      id: json['id'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String tell;
  final String password;
  final String protectedId;
  final String protectedName;
  final String protectedAddress;
  final String protectedTell;

  User(
      {required this.id,
      required this.name,
      required this.tell,
      required this.password,
      required this.protectedId,
      required this.protectedName,
      required this.protectedAddress,
      required this.protectedTell});

  // ファクトリメソッド
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      tell: json['tell'],
      password: json['password'],
      protectedId: json['protected_id'],
      protectedName: json['protected_name'],
      protectedAddress: json['protected_address'],
      protectedTell: json['protected_tell'],
    );
  }
}

// TODO: ページ変わるたびに取得するのが良さそう。
Future<List<Reaction>> getReactions(int userId) async {
  try {
    DateTime now = DateTime.now();
    List<Reaction> reactionList = [];
    final response = await http.get(
      Uri.parse('http://10.0.2.2:3001/api/v1/users/${userId}/reactions'
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

Future<LoginResponse> login(String tell, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/api/v1/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'tell': tell,
        'password': password,
      }),
    );
    // if(response.statusCode == 201){
    print('statusCode: ${response.statusCode}');
    // final jsonRes = await jsonDecode(response.body);
    // print('jsonRes: ${jsonRes.toString()}');
    // }

    LoginResponse loginResponse =
        LoginResponse.fromJson(jsonDecode(response.body));

    return loginResponse;
  } catch (e) {
    throw Exception(e);
  }
}

Future<CreateUserResponse> createUser(String name, String tell, String password,
    String protectedName, String protectedAddress, String protectedTell) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/api/v1/users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'tell': tell,
        'password': password,
        'protected_name': protectedName,
        'protected_address': protectedAddress,
        'protected_tell': protectedTell,
      }),
    );
    // if(response.statusCode == 201){
    print('statusCode: ${response.statusCode}');
    // final jsonRes = await jsonDecode(response.body);
    // print('jsonRes: ${jsonRes.toString()}');
    // }

    CreateUserResponse createUserResponse =
        CreateUserResponse.fromJson(jsonDecode(response.body));

    return createUserResponse;
  } catch (e) {
    throw Exception(e);
  }
}

Future<CreateUserResponse> getReaction(
    String name,
    String tell,
    String password,
    String protectedName,
    String protectedAddress,
    String protectedTell) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/api/v1/users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'tell': tell,
        'password': password,
        'protected_name': protectedName,
        'protected_address': protectedAddress,
        'protected_tell': protectedTell,
      }),
    );
    // if(response.statusCode == 201){
    print('statusCode: ${response.statusCode}');
    // final jsonRes = await jsonDecode(response.body);
    // print('jsonRes: ${jsonRes.toString()}');
    // }

    CreateUserResponse createUserResponse =
        CreateUserResponse.fromJson(jsonDecode(response.body));

    return createUserResponse;
  } catch (e) {
    throw Exception(e);
  }
}

Future<User> getUser(int id) async {
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:3001/api/v1/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    // if(response.statusCode == 201){
    print('statusCode: ${response.statusCode}');
    // final jsonRes = await jsonDecode(response.body);
    // print('jsonRes: ${jsonRes.toString()}');
    // }

    User user = User.fromJson(jsonDecode(response.body));

    return user;
  } catch (e) {
    throw Exception(e);
  }
}
