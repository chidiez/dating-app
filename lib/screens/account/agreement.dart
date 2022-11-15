import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/nav/bottomNav.dart';
import 'package:vanilla/widgets/buttonWidget.dart';
import 'package:vanilla/widgets/textWidget.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          //text: user.displayName!,
          text: 'Sign up',
          fontSize: 17,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Date, meet or hookup with respect',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 30,
            ),

            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 7, 0),
                    child: Text("We are glad that you opted to sign up for Vanilla dating app, and we are excited to be part of your journey and experience.\n\nPlease be considerate, so that everyone has a good time here.\n\nRemember that there are 2 rules strictly forbidden: \n\n1. Abusive language, profanity, violence or violent behavior of any kind... \n2. Images containing nudity or sexual content... \n\nAt Vanilla we treat everyone with respect and kindness and we don’t discriminate, regardless of your gender, sexual orientation or religion.\n\nWe are constantly improving Vanilla to become safe and inclusive place for everyone. Please join us and adhere to our terms and conditions and guidelines.\n\nWith love and respect, the Vanilla team.",
                    textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, wordSpacing: 1.2, letterSpacing: 0.2, height: 1.3),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ButtonWidget(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    const BottomNav()), (Route<dynamic> route) => false);
              },
              text: 'Agree and Start exploring',
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
