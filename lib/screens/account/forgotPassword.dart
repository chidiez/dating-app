import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttonWidget.dart';
import '../../widgets/textFormWidget.dart';
import '../../widgets/textWidget.dart';

class ForgotPassword extends StatefulWidget {

  ForgotPassword({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    //TODO: implement createState
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword>{
  String email = "";

  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextWidget(
                text: 'Forgot your password?',
                fontSize: 25,
                color: const Color(0xFFB81F8F),
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 10.0,),
              TextWidget(
                text: 'Enter your email address and we will send you instructions on how to reset your password.',
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(height: 10.0,),
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
              const SizedBox(height: 80.0,),
              // ignore: deprecated_member_use

              ButtonWidget (
                onPressed: () => resetPassword(),
                text: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );

   try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());

     //Utils.showSnackBar('Password reset email sent');

     Navigator.of(context).popUntil((route) => route.isFirst);
   }on FirebaseAuthException catch (e) {
     print(e);

     //Utils.showSnackBar(e.message);
     Navigator.of(context).pop();
   }
  }
}