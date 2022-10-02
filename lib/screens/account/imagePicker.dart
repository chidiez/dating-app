import 'package:flutter/material.dart';
import 'package:vanilla/nav/bottomNav.dart';

import '../../widgets/buttonWidget.dart';
import '../../widgets/imagePickerWidget.dart';
import '../../widgets/textWidget.dart';


class ProfileImagesScreen extends StatefulWidget {
  const ProfileImagesScreen({Key? key}) : super(key: key);

  @override
  _ProfileImagesScreenState createState() => _ProfileImagesScreenState();
}

class _ProfileImagesScreenState extends State<ProfileImagesScreen> {


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
          text: 'Gallery',
          fontSize: 20,
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
              text: 'Add photos of yourself',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 30,
            ),

            /*Expanded(
                child: InkWell(
                  onTap: (){
                    getMultiImage();
                  },
                  child: GridView.builder(
              itemCount: images!.isEmpty ? 1 : images!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => Container(
                    height: 200,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: images!.isEmpty ? 
                    IconButton(
                      icon: Image.asset('assets/icons/add-image.png',),
                      onPressed: () { },
                    ): Image.file(File(images![index].path),
                    fit: BoxFit.cover,
                    ),
                  )),
                )),*/


            //const SizedBox(height: 50,),


            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ImagePickerWidget(),

                      ImagePickerWidget(),

                      ImagePickerWidget(),
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ImagePickerWidget(),

                      ImagePickerWidget(),

                      SizedBox(
                        //height: 220,
                        width: 111,
                        //color: Colors.white10,
                      ),
                    ],
                  ),

                ],
              ),
            ),
            ButtonWidget (onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNav())), text: 'Continue',),
            const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
