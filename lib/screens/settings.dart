import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/widgets/subscribeCard.dart';
import 'package:vanilla/widgets/buttonWidget.dart';
import 'package:vanilla/widgets/textWidget.dart';
import 'package:vanilla/screens/filterExplore.dart';

import 'account/signUpOptions.dart';

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
            icon: Image.asset(
              'assets/icons/filter.png',
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FilterExplorePage()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubBanner(),
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
                    icon: Icons.arrow_forward_ios,
                    option: '',
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
                    icon: Icons.arrow_forward_ios,
                    option: '',
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
                    icon: Icons.arrow_forward_ios,
                    option: '',
                  ),
                  const Divider(),
                  ButtonNextWidget(
                    text: 'Privacy Policy',
                    onTap: () {},
                    icon: Icons.arrow_forward_ios,
                    option: '',
                  ),
                  const Divider(),
                  ButtonNextWidget(
                    text: 'Terms & Conditions',
                    onTap: () {},
                    icon: Icons.arrow_forward_ios,
                    option: '',
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
                    icon: Icons.arrow_forward_ios,
                    option: '',
                  ),
                  const Divider(),
                  ButtonNextWidget(
                    text: 'Log Out',
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          const SigningOptions()), (Route<dynamic> route) => false);
                    },
                    icon: Icons.arrow_forward_ios,
                    option: '',
                  ),
                  Spacer(),
                  Center(
                    child: TextWidget(
                      align: TextAlign.center,
                      text: '© Vanilla. 2022. \nDeveloped by neorac.tech',
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
