import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/input_field.dart';
import '../components/signup_container.dart';
import '../domain/reaction_controller.dart';
import '../domain/user_controller.dart';

// TODO: メモリーリーク
// TODO: const context
final nameControllerProvider = Provider((ref) {
  return TextEditingController();
});

final tellControllerProvider = Provider((ref) {
  return TextEditingController();
});

final passwordControllerProvider = Provider((ref) {
  return TextEditingController();
});

final protectedNameControllerProvider = Provider((ref) {
  return TextEditingController();
});

final protectedAddressControllerProvider = Provider((ref) {
  return TextEditingController();
});

final protectedTellControllerProvider = Provider((ref) {
  return TextEditingController();
});

//会員登録画面
class FirstSignUpPage extends ConsumerWidget {
  const FirstSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final nameController = ref.read(nameControllerProvider);
    final tellController = ref.read(tellControllerProvider);
    final passwordController = ref.read(passwordControllerProvider);
    final protectedNameController = ref.read(protectedNameControllerProvider);
    final protectedAddressController =
        ref.read(protectedAddressControllerProvider);
    final protectedTellController = ref.read(protectedTellControllerProvider);

    final reactionState = ref.watch(reactionProvider.notifier);
    final userState = ref.watch(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('新規会員登録'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            SignupContainer(
              text: '契約者',
              widgetList: [
                InputField(
                  text: '氏名',
                  controller: nameController,
                ),
                InputNumberField(text: '電話番号', controller: tellController),
                InputField(text: 'パスワード', controller: passwordController),
              ],
            ),
            SignupContainer(
              text: '利用者',
              widgetList: [
                InputField(text: '氏名', controller: protectedNameController),
                InputField(text: '住所', controller: protectedAddressController),
                InputNumberField(
                    text: '電話番号', controller: protectedTellController),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await userState.create(
                        nameController.text,
                        tellController.text,
                        passwordController.text,
                        protectedNameController.text,
                        protectedAddressController.text,
                        protectedTellController.text);
                    final user = ref.watch(userProvider);
                    await reactionState.getReactionState(user!.id);

                    if (context.mounted) {
                      context.push('/home');
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('新規会員登録が完了しました。'),
                      ),
                    );
                  } catch (e) {
                    await showDialog(
                      context: context,
                      builder: (_) {
                        return const SimpleDialog(
                          title: Text('新規会員登録に失敗しました'),
                          children: <Widget>[
                            Text('入力内容を確認してください。'),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('新規会員登録'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
