import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Controllers/user_controller.dart';
import '../core/state.dart';
import '../utils/colors.dart';
import 'widgets/app_button_widget.dart';
import 'widgets/text_field_widget.dart';

class PasswordRecoveryPage extends ConsumerStatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  ConsumerState<PasswordRecoveryPage> createState() =>
      _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends ConsumerState<PasswordRecoveryPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(passwordRecoveryProvider);
    ref.listen(passwordRecoveryProvider, (previous, next) {
      if (next.status == Status.loaded) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: next.data ?? 'Recovery email sent successfully!!!',
            timeInSecForIosWeb: 6);
      }
      if (next.status == Status.error) {
        Fluttertoast.showToast(
            msg: next.message ?? 'An error occurred !', timeInSecForIosWeb: 6);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Recovery'),
        actions: [
          userState.status == Status.loading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
              : Container()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFieldWidget(
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more validation if needed
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            AppButtonWidget(
              borderRadius: 15,
              onTap: userState.status == Status.loading
                  ? null
                  : () async {
                      if (emailController.text.isNotEmpty) {
                        ref
                            .watch(passwordRecoveryProvider.notifier)
                            .login(emailController.text.trim());
                      }
                    },
              child: const Text('Reset Password',
                  style: TextStyle(color: whiteColor)),
            ),
          ],
        ),
      ),
    );
  }
}
