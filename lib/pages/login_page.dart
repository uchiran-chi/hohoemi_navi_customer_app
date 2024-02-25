import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hohoemi_navi_customer_app/domain/user_controller.dart';

import '../components/input_field.dart';
import '../domain/reaction_controller.dart';

// HACK: データの持ち方要検討
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
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/icon.png'),
                height: 250,
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Text(
                  'ほほえみ Navi',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFE84B84),
                  ),
                ),
              ),
              InputNumberField(text: '電話番号', controller: tellController),
              InputField(
                  text: 'パスワード',
                  controller: passwordController,
                  obscureText: true),
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

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ログインが完了しました。'),
                          ),
                        );
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
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }
}
