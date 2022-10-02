
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../nav/bottomNav.dart';
import '../../widgets/buttonWidget.dart';
import '../../widgets/textWidget.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    //user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 20));
      setState(() => canResendEmail = true);
    } catch (e) {
      //Utils.showSnackBar(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const BottomNav()
      : Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'Enter your code',
          fontSize: 22,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black38,
            ),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        //padding: const EdgeInsets.only(left: 5, right: 5,),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: 'A verification email has been sent to your mailbox.',
              fontSize: 22,
              color: const Color(0xFFB81F8F),
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 20,),

            ButtonWidget (onPressed: () => canResendEmail ? sendVerificationEmail() : null, text: 'Resend Email',),
            const SizedBox(height: 10,),
            TextButton(onPressed: () => FirebaseAuth.instance.signOut(), child: const Text('Cancel', style: TextStyle(fontSize: 20, fontFamily: 'Proxima Nova'),))
          ],
        ),
      ),
    );
  }
