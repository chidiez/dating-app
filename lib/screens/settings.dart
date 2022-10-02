import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/buttonWidget.dart';
import '../widgets/subscribePopUp.dart';
import '../widgets/textWidget.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  _settingScreenState createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'Settings',
          fontSize: 20,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/filter.png', color: Colors.black87,),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFB81F8F),
              child: Column(
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  TextWidget(
                    text: "You're on our free plan",
                    fontSize: 20,
                    isUnderLine: true,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    text: 'You want to make the most out of Vanilla?',
                    fontSize: 16,
                    isUnderLine: true,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => subscribeButton());
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Become VIP member',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Proxima Nova",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 10,
                  right: 5,
                ),
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'General',
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    ButtonNextWidget(
                      text: 'Push Notifications',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const settingScreen()));
                      },
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                    const Divider(),
                    ButtonNextWidget(
                      text: 'Language',
                      onTap: () {},
                      icon: Icons.arrow_forward_ios,
                      option: 'Coming soon',
                    ),
                    const Divider(),
                    ButtonNextWidget(
                      text: 'Share App',
                      onTap: () {},
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                    TextWidget(
                      text: 'Help & Support',
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    ButtonNextWidget(
                      text: 'Send us Feedback',
                      onTap: () {},
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                    const Divider(),
                    ButtonNextWidget(
                      text: 'Privacy Policy',
                      onTap: () {},
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                    const Divider(),
                    ButtonNextWidget(
                      text: 'Terms & Conditions',
                      onTap: () {},
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                    TextWidget(
                      text: 'Account',
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    ButtonNextWidget(
                      text: 'Delete Account',
                      onTap: () {},
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                    const Divider(),
                    ButtonNextWidget(
                      text: 'Log Out',
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: Icons.arrow_forward_ios, option: '',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}

