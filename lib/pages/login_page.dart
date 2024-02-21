import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hohoemi_navi_customer_app/domain/user_controller.dart';

import '../components/input_field.dart';
import '../domain/reaction_controller.dart';

// TODO: メモリーリーク
// TODO: const context
final tellControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final passwordControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

//ログイン画面
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();

    final reactionState = ref.watch(reactionProvider.notifier);
    final userState = ref.watch(userProvider.notifier);

    final tellController = ref.read(tellControllerProvider);
    final passwordController = ref.read(passwordControllerProvider);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ほほえみ NAVI',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 180),
            InputNumberField(text: '電話番号', controller: tellController),
            InputField(text: 'パスワード', controller: passwordController),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await userState.login(
                        tellController.text, passwordController.text);
                    final user = ref.watch(userProvider);
                    await reactionState.getReactionState(user!.id);
                    if (context.mounted) {
                      context.push('/home');
                    }
                  } catch (e) {
                    await showDialog(
                      context: context,
                      builder: (_) {
                        return const SimpleDialog(
                          title: Text('ログインに失敗しました'),
                          children: <Widget>[
                            Text('入力内容を確認してください。'),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('ログイン'),
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              child: OutlinedButton(
                onPressed: () {
                  context.push('/first_signup_page');
                },
                child: const Text(
                  '新規登録',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
