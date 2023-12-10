import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urbanecoflow/forms/signupscreen.dart';
import 'package:urbanecoflow/pages/Homepage.dart';

import '../controllers/user_controller.dart';
import '../core/state.dart';
import '../pages/reset_password_screen.dart';
import '../pages/widgets/app_button_widget.dart';
import '../pages/widgets/text_field_widget.dart';
import '../utils/colors.dart';
import '../utils/helpers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    ref.listen(userProvider, (previous, next) {
      if (next.status == Status.loaded) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MyHomePage()) // Replace 'HomePage' with your actual home page widget
            );
      }
      if (next.status == Status.error) {
        Fluttertoast.showToast(
            msg: next.message ?? 'An error occurred !', timeInSecForIosWeb: 6);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                      )),
                )
              : Container()
        ],
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // width: 400.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person,
                    size: 100.0,
                    // backgroundImage: NetworkImage(
                    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZsuxUrEVyvCmLYoM5BeyNUOts2akw1RFDYw&usqp=CAU",
                    // ),
                  ),
                  // const CircleAvatar(
                  //   radius: 50.0,
                  //   backgroundImage: NetworkImage(
                  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZsuxUrEVyvCmLYoM5BeyNUOts2akw1RFDYw&usqp=CAU",
                  //   ),
                  // ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          controller: emailController,
                          prefixIcon: const Icon(Icons.email),
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!Helpers.emailValidator(value)) {
                              return 'The Entered email is not valid';
                            }
                            // You can add more validation if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldWidget(
                          controller: passwordController,
                          label: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            child: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onTap: () {
                              // Toggle password visibility
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more validation if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordRecoveryPage()),
                              );
                              // Placeholder for "Forgot Password?" functionality
                              // You can implement password recovery logic here
                              // For instance, navigate to a password recovery page
                            },
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        AppButtonWidget(
                            borderRadius: 15,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                ref.read(userProvider.notifier).login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                              }
                            },
                            child: const Text('Log In',
                                style: TextStyle(color: whiteColor))),
                        const SizedBox(height: 30),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     labelText: 'Username',
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //     prefixIcon: const Icon(Icons.person),
                        //   ),
                        // ),
                        // const SizedBox(height: 10.0),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     labelText: 'Password',
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //     prefixIcon: const Icon(Icons.lock),
                        //   ),
                        //   obscureText: true,
                        // ),
                        // const SizedBox(height: 15.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Checkbox(
                        //           value: false,
                        //           onChanged: (bool? value) {},
                        //         ),
                        //         const Text('Remember Me'),
                        //       ],
                        //     ),
                        //     TextButton(
                        //       onPressed: () {},
                        //       child: const Text('Forgot Password?'),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 15.0),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const MyHomePage(),
                        //         ),
                        //       );
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.green,
                        //       foregroundColor: Colors.white,
                        //       textStyle: const TextStyle(
                        //         fontSize: 18.0,
                        //       ),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10.0),
                        //       ),
                        //     ),
                        //     child: const Text('Login'),
                        //   ),
                        // ),
                        // const SizedBox(height: 10.0),
                        // const Text("----OR----"),
                        // const SizedBox(height: 10.0),
                        // const Text("Log in using"),
                        // const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.g_translate_rounded),
                              label: const Text('Google'),
                            ),
                            const SizedBox(width: 10.0),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.facebook),
                              label: const Text('Facebook'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            const SizedBox(width: 5.0),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: const Text('Register',
                                    style: TextStyle(color: primaryColor))),
                          ],
                        ),
                      ],
                    ),
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
