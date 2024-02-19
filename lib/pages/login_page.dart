import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/input_field.dart';
import '../domain/reaction_controller.dart';

//ログイン画面
class LoginPage extends ConsumerWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){

    final deviceWidth = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const InputField(text: 'メールアドレス'),
            const InputField(text: 'パスワード'),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  ref.watch(reactionProvider.notifier).getReactionState(1);
                  context.push('/home');
                },
                child: const Text('ログイン'),
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: (){
                  context.push('/first_signup_page');
                },
                child: const Text('新規会員登録'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}