import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/services/firebaseServices.dart';

import '../../main.dart';
import '../../screens/account/forgotPassword.dart';
import '../../screens/account/signUp.dart';
import '../buttonWidget.dart';
import '../textFormWidget.dart';
import '../textWidget.dart';

class EmailLogIn extends StatefulWidget {
  const EmailLogIn({Key? key}) : super(key: key);

  @override
  State<EmailLogIn> createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void loginWithEmail() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context,
    );
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
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
                const SizedBox(height: 15,),
                TextInput(
                  textString: 'p*****rd',
                  textController: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value != null && value.length < 6
                      ? 'Enter a minimum of 6 characters'
                      : null,
                ),
                TextWidget(text: "Your password must have: 8 to 20 characters, letters, numbers and special characters.",
                  fontSize: 9,
                  color: Colors.black26,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotPassword()));
                      },
                      child: TextWidget(
                        text: "Forgot Password?",
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,),
                        //textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 30.0,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: TextStyle(
                          color: Colors.black,
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
                          color: Colors.black,
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
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),

                ButtonWidget (
                  onPressed: loginWithEmail,
                  text: 'Log In',
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account?  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
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
      ]));
}
