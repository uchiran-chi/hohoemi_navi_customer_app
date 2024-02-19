  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/input_field.dart';
import '../components/signup_container.dart';

//会員登録画面
class FirstSignUpPage extends ConsumerWidget {
  const FirstSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規会員登録'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            SignupContainer(
              text: 'メールアドレス/ パスワード',
              widgetList: const [
                InputField(text: 'メールアドレス'),
                InputField(text: 'パスワード'),
                InputField(text: 'パスワードの再入力'),
              ],
            ),
            SignupContainer(
              text: '契約者',
              widgetList: const [
                InputField(text: '氏名'),
                InputField(text: '電話番号'),
              ],
            ),
            SignupContainer(
              text: '利用者',
              widgetList: const [
                InputField(text: '氏名'),
                InputField(text: '電話番号'),
                InputField(text: '住所'),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
