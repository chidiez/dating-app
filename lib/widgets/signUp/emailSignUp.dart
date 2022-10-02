import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:vanilla/screens/account/logIn.dart';
import 'package:vanilla/screens/account/profileSetUp.dart';
import 'package:vanilla/services/firebaseServices.dart';
import '../buttonWidget.dart';
import '../textFormWidget.dart';
import '../textWidget.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({Key? key}) : super(key: key);

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void signUpWithEmail() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
    if (FirebaseAuth == LoginStatus.success) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SetProfilePage()));
    }else {
      print('sign up failed!');
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextInput(
                      textString: 'user@email.com',
                      textController: emailController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextInput(
                      textString: 'p*****rd',
                      textController: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter a minimum of 6 characters'
                          : null,
                    ),
                    TextWidget(
                      text:
                          "Your password must have: 8 to 20 characters, letters, numbers and special characters.",
                      fontSize: 9,
                      color: Colors.black26,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing, you agree to our ',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' and \nacknowledge that you have read our ',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' to \nlearn how we collect, use and share your data.  ',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    ButtonWidget(
                      onPressed: signUpWithEmail,
                      text: 'Next',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account?  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      );
}
