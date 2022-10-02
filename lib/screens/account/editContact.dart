import 'package:flutter/material.dart';

import '../../widgets/textFormWidget.dart';
import '../../widgets/textWidget.dart';

class EditMyContact extends StatefulWidget {
  const EditMyContact({Key? key}) : super(key: key);

  @override
  State<EditMyContact> createState() => _EditMyContactState();
}

class _EditMyContactState extends State<EditMyContact> {

  final passwordController = TextEditingController();

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
          text: 'Edit Contacts',
          fontSize: 20,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          TextButton(

              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save',
                style: TextStyle(
                  fontSize: 19, color: Color(0xFFB81F8F), fontWeight: FontWeight.w400,
                ),)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white10,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      SizedBox(width: 15,),
                      Text('Phone',
                          style: const TextStyle(
                            fontSize: 14, height: 1.5, color: Colors.black,
                          ),
                      ),
                    ],
                  ),
                  Container(
                    width: 180,
                    child: TextInput(
                      textString: 'Phone number',
                      textController: passwordController,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white10,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Image.asset('assets/facebook.png', color: Colors.white, fit: BoxFit.scaleDown,),
                      ),
                      SizedBox(width: 15,),
                      Text('Facebook',
                        style: const TextStyle(
                          fontSize: 14, height: 1.5, color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 180,
                    child: TextInput(
                      textString: 'username',
                      textController: passwordController,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white10,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Image.asset('assets/whatsapp.png', color: Colors.white, fit: BoxFit.scaleDown,),
                      ),
                      SizedBox(width: 15,),
                      Text('WhatsApp',
                        style: const TextStyle(
                          fontSize: 14, height: 1.5, color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 180,
                    child: TextInput(
                      textString: 'WhatsApp number',
                      textController: passwordController,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white10,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Image.asset('assets/instagram.png', color: Colors.white, fit: BoxFit.scaleDown,),
                      ),
                      const SizedBox(width: 15,),
                      const Text('Instagram',
                        style: TextStyle(
                          fontSize: 14, height: 1.5, color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 180,
                    child: TextInput(
                      textString: 'handle',
                      textController: passwordController,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
