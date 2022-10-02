import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/services/firebaseServices.dart';

import '../../screens/account/forgotPassword.dart';
import '../../screens/account/signUp.dart';
import '../buttonWidget.dart';
import '../textFormWidget.dart';
import '../textWidget.dart';

class PhoneLogIn extends StatefulWidget {
  const PhoneLogIn({Key? key}) : super(key: key);

  @override
  State<PhoneLogIn> createState() => _PhoneLogInState();
}

class _PhoneLogInState extends State<PhoneLogIn> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void phoneSignIn() async {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text);
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const SizedBox(
            height: 1.0,
          ),
          TextInput(
            textString: 'Phone number',
            textController: phoneController,
            obscureText: false,
            keyboardType: TextInputType.phone,
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text:
                      'Your phone number will be used to improve your XXX experience, \nincluding connecting you with people you may know, personalising \nyour ads experience, and more. If you sign up with SMS. SMS fees \nmay apply.  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: 'Learn more',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ForgotPassword()));
                },
                child: TextWidget(
                  text: "Forgot Password?",
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ButtonWidget(
            onPressed: phoneSignIn,
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
        ]),
      );
}
