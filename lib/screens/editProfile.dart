import 'package:flutter/material.dart';
import 'package:vanilla/screens/account/editContact.dart';
import 'package:vanilla/screens/settings.dart';
import 'package:vanilla/widgets/profileCard.dart';
import '../widgets/buttonWidget.dart';
import '../widgets/imagePickerWidget.dart';
import '../widgets/textWidget.dart';

class editProfileScreen extends StatefulWidget {
  const editProfileScreen({Key? key}) : super(key: key);

  @override
  _editProfileScreenState createState() => _editProfileScreenState();
}

class _editProfileScreenState extends State<editProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black87,),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'Edit Profile',
          fontSize: 20,
          //isUnderLine: true,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye, color: Colors.black87,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const myProfilePublicView()));
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.only(left: 5, top: 20, right: 5,),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'My photos',
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ImagePickerWidget(),

                  ImagePickerWidget(),

                  ImagePickerWidget(),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ImagePickerWidget(),

                  ImagePickerWidget(),

                  SizedBox(
                    //height: 170,
                    width: 111,
                    //color: Colors.white10,
                  ),
                ],
              ),
              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'My contacts',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditMyContact()));
                    },
                      child: TextWidget(
                        text: 'Edit',
                        fontSize: 15,
                        isUnderLine: true,
                        color: const Color(0xFFB81F8F),
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: Container(
                    color: Colors.purple[100],
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Image.asset('assets/telephone.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Image.asset('assets/facebook.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Image.asset('assets/whatsapp.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Image.asset('assets/instagram.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                      ],
                    ),
                  ),
              ),

              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'About me',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontSize: 15,
                    isUnderLine: true,
                    color: const Color(0xFFB81F8F),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: Container(color: Colors.purple[100], height: 90, width: double.infinity,)
              ),

              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'My interests',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontSize: 15,
                    isUnderLine: true,
                    color: const Color(0xFFB81F8F),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: Container(color: Colors.purple[100], height: 100, width: double.infinity,)
              ),

              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'My basics',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontSize: 15,
                    isUnderLine: true,
                    color: const Color(0xFFB81F8F),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              ButtonNextWidget(text: 'Location', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Abuja',),
              ButtonNextWidget(text: 'Body type', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Muscular',),
              ButtonNextWidget(text: 'Height', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: '167',),
              ButtonNextWidget(text: 'Looking for', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Women',),
              ButtonNextWidget(text: 'Drinking', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Socially',),
              ButtonNextWidget(text: 'Smoking', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Heavily',),
              ButtonNextWidget(text: 'Sexual orientation', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Straight',),
              ButtonNextWidget(text: 'Home town', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: '---',),
              ButtonNextWidget(text: 'Bedroom', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'BDSM',),
              ButtonNextWidget(text: 'Travel', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Yes',),
              ButtonNextWidget(text: 'Relationship status', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Flirting',),


              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  TextWidget(
                    text: 'Languages',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontSize: 15,
                    isUnderLine: true,
                    color: const Color(0xFFB81F8F),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: Container(
                    color: Colors.purple[100],
                    height: 60,
                    width: double.infinity,
                    ),
                  ),


              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  TextWidget(
                    text: 'Preferences',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontSize: 15,
                    isUnderLine: true,
                    color: const Color(0xFFB81F8F),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              ButtonNextWidget(text: 'Show me', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Women',),
              ButtonNextWidget(text: 'Age range', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: '22 - 40',),
              ButtonNextWidget(text: 'Allow contact', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const settingScreen())); }, icon: Icons.arrow_forward_ios, option: 'Allow',),


              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  TextWidget(
                    text: 'Bedroom',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: 'Edit',
                    fontSize: 15,
                    isUnderLine: true,
                    color: const Color(0xFFB81F8F),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: Container(color: Colors.purple[100], height: 100, width: double.infinity,)
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ],
        ),

      ),
    );
  }
}



