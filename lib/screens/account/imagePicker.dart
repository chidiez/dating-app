import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vanilla/widgets/buttonWidget.dart';
import 'package:vanilla/widgets/textWidget.dart';
import 'package:vanilla/screens/account/agreement.dart';

class ProfileImagesScreen extends StatefulWidget {
  const ProfileImagesScreen({Key? key}) : super(key: key);

  @override
  _ProfileImagesScreenState createState() => _ProfileImagesScreenState();
}

class _ProfileImagesScreenState extends State<ProfileImagesScreen> {
  final ImagePicker _multiPicker = ImagePicker();
  List<XFile> _selectedFiles = [];
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  List<String> _arrImageUrls = [];

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
          text: user.displayName!,
          //text: 'Gallery',
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
                  InkWell(
                    onTap: () {
                      selectImages();
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 170,
                                width: 111,
                                color: Colors.purple[100],
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/icons/add-image.png',
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        _selectedFiles.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text('Select 5 or more images'),
                              )
                            : Expanded(
                                child: GridView.builder(
                                    itemCount: _selectedFiles.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Image.file(
                                          File(_selectedFiles[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }),
                              )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ButtonWidget(
              onPressed: () {
                uploadFunction(_selectedFiles);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AgreementScreen()));
              },
              text: 'Continue',
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  void uploadFunction(List<XFile> _images){
    for(int i=0 ; i<_images.length; i++){
      var imageUrl = uploadFIle(_images[i]);
      _arrImageUrls.add(imageUrl.toString());
    }
  }
  
  Future<String> uploadFIle(XFile _image) async {
    Reference reference = _storageRef.ref().child("userImages").child(_image.name);
    UploadTask uploadTask = reference.putFile(File(_image.path));
    await uploadTask.whenComplete(() => {
      print(reference.getDownloadURL())
    });

    return await reference.getDownloadURL();
  }
  
  Future<void> selectImages() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }
    try {
      final List<XFile>? imgs = await _multiPicker.pickMultiImage();
      if (imgs!.isNotEmpty) {
        _selectedFiles.addAll(imgs);
      }
    } catch (e) {
      print("Something went wrong. " + e.toString());
    }
    setState(() {});
  }
}
