import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/screens/editProfile.dart';
import 'package:vanilla/screens/settings.dart';
import 'package:vanilla/widgets/subscribeCard.dart';

import '../../widgets/subscribePopUp.dart';
import '../../widgets/textWidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: user.displayName!,
          fontSize: 17,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/settings.png', color: Colors.black87,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen()));
            },
          ),
        ],
      ),
      body: Container(
        //margin: const EdgeInsets.only(left: 10, right: 10),
        //padding: const EdgeInsets.only(left: 5, top: 20, right: 5,),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              radius: 70,
            ),
            const SizedBox(height: 13,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const editProfileScreen()));
              },
                child: const Text('Edit Profile',
                  style: TextStyle(fontSize: 15,
                      color: Color(0xFFB81F8F),
                      fontWeight: FontWeight.bold
                  ),
                ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Likes", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                    Text("191", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Views", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                    Text("220", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 23,),
            const SubBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("VIP Benefits"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(left: 5,  right: 5,),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  shrinkWrap: true,
                  //scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        vipBenefits(text: ' Unlimited chats',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' Make video and audio calls',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' View only people you liked',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' No ads',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' Unlimited users',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' See who liked you',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' Send photo and other media in chats',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' Access all awesome updates of our app',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' Advanced filters to easily find your match',),
                        SizedBox(height: 5,),
                        vipBenefits(text: ' Choose who can contact you',),
                        SizedBox(height: 5,),
                    ],
                  ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class vipBenefits extends StatelessWidget {


  final String text;

  const vipBenefits({
    Key? key,

    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.check_circle, color: Color(0xFFB81F8F), size: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text, style: TextStyle(fontSize: 15),),
        ),
      ],
    );
  }
}

