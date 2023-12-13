import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/user_controller.dart';
import '../core/state.dart';
import '../pages/widgets/app_button_widget.dart';
import '../pages/widgets/text_field_widget.dart';
import '../utils/colors.dart';
import '../utils/helpers.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController contactController = TextEditingController();

  bool showPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        actions: [
          userState.status == Status.loading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                      strokeWidth: 1,
                    ),
                  ),
                )
              : Container()
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   color: Color.fromRGBO(8, 8, 0,
        //       0.5), // Transparent white (adjust the alpha value as needed)
        // ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(
                    CupertinoIcons.person,
                    size: 100.0,
                    // backgroundImage: NetworkImage(
                    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZsuxUrEVyvCmLYoM5BeyNUOts2akw1RFDYw&usqp=CAU",
                    // ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: usernameController,
                    label: 'Full name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: emailController,
                    label: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!Helpers.emailValidator(value)) {
                        return 'The Entered email is not valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: passwordController,
                    label: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(showPassword
                          ? Icons.visibility_sharp
                          : Icons.visibility_off_rounded),
                    ),
                    obscureText: showPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: showPassword,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(showPassword
                          ? Icons.visibility_sharp
                          : Icons.visibility_off_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  AppButtonWidget(
                      borderRadius: 15,
                      onTap: userState.status == Status.loading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                // signUp(
                                //   emailController.text,
                                //   passwordController.text,
                                //   usernameController.text,
                                //   contactController.text,
                                // );
                                ref.read(userProvider.notifier).register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: usernameController.text);
                              }
                            },
                      child: const Text('Register',
                          style: TextStyle(color: whiteColor))),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
