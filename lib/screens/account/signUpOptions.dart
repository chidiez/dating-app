import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/services/firebaseServices.dart';

import '../../widgets/textWidget.dart';
import 'logIn.dart';

class SigningOptions extends StatefulWidget {
  static String routeName = '/signup-options';
  const SigningOptions({Key? key}) : super(key: key);

  @override
  _SigningOptionsState createState() => _SigningOptionsState();
}

class _SigningOptionsState extends State<SigningOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 75),
          TextWidget(
            text: 'Vanilla',
            fontSize: 35,
            color: const Color(0xFFB81F8F),
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: TextWidget(
              align: TextAlign.center,
              text:
                  'Access profile, meet other people, chat, talk, establish friends, agree to meet, and more.',
              fontSize: 14,
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 55),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.white,
                side: const BorderSide(color: Color(0xFFB81F8F)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Use phone / email',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Proxima Nova'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithFacebook(context);
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.white,
                side: const BorderSide(color: Color(0xFFB81F8F)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Continue with Facebook',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Proxima Nova'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithGoogle(context);
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.white,
                side: const BorderSide(color: Color(0xFFB81F8F)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Proxima Nova',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          /* SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.white,
                side: const BorderSide(color: Color(0xFFB81F8F)),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(3,),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Continue with Apple',
                style: TextStyle(
                    fontSize: 18, color: Colors.black, fontFamily: 'Proxima Nova',),
              ),
            ),
          ), */

          const SizedBox(
            height: 20,
          ),
          const Text(
            'You have to be 18 or older to create a profile.',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              fontFamily: 'Proxima Nova',
            ),
          ),
          const Spacer(),
          Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' and \nacknowledge that you have read our ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' to \nlearn how we collect, use and share your data.  ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: const Color(0xFFB81F8F),
            height: 60,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
