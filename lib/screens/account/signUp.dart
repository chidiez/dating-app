import 'package:flutter/material.dart';
import 'package:vanilla/widgets/signUp/phoneSignUp.dart';
import '../../widgets/signUp/emailSignUp.dart';
import '../../widgets/textWidget.dart';


class SignUpScreen extends StatefulWidget {
  static String routeName = '/sign-up';

  const SignUpScreen({super.key});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black87,
          ),
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'Sign Up',
            fontSize: 20,
            color: const Color(0xFFB81F8F),
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.white10,
          actions: [
            IconButton(
              icon: Image.asset('assets/icons/help.png', color: Colors.black87,),
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
            children: [
              const TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Phone",
                  ),
                  Tab(
                    text: "Email",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: const PhoneSignUp(),
                    ),
                    Container(
                      child: const EmailSignUp(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
