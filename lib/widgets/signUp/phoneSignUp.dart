import 'package:flutter/material.dart';
import 'package:vanilla/screens/account/logIn.dart';

import '../../screens/account/signUp.dart';
import '../buttonWidget.dart';
import '../textFormWidget.dart';
import '../textWidget.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  State<PhoneSignUp> createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
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
        validator: (value) =>
        value != null && value.length < 6
            ? 'Enter a minimum of 6 characters'
            : null,
      ),
      TextWidget(
        text: "Your password must have: 8 to 20 characters, letters, numbers and special characters.",
        fontSize: 9,
        color: Colors.black26,
        fontWeight: FontWeight.w300,
      ),
      const SizedBox(
        height: 30.0,
      ),
      ButtonWidget (
        onPressed: () {},
        text: 'Next',
      ),
      const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
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
    ]),
  );
}
