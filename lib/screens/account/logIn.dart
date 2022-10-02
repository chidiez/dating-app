import 'package:flutter/material.dart';
import '../../widgets/signIn/emailLogIn.dart';
import '../../widgets/signIn/phoneLogIn.dart';
import '../../widgets/textWidget.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/log-in';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
            text: 'Log In',
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
                      child:  PhoneLogIn(),

                      ),
                    Container(
                      child: EmailLogIn(),

                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              )

          ),


    );
  }
  
}