import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _multiPicker = ImagePicker();
  List<XFile> _selectedFiles = [];
  FirebaseStorage _storageRef = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.file(File(_selectedFiles[index].path), fit: BoxFit.cover,),
                      );
                    }),
              )
        ],
      ),
    );
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
