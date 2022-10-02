import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  final multiPicker = ImagePicker();
  List <XFile> ? images = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        getMultiImage();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 170,
              width: 111,
              color: Colors.purple[100],
              child: IconButton(icon: Image.asset('assets/icons/add-image.png',), onPressed: () {  },),
            ),
          ),
        ],
      ),
    );
  }

  Future getMultiImage() async {
    final List<XFile>? selectedImages = await multiPicker.pickMultiImage();
    setState(() {
      if (selectedImages!.isNotEmpty){
        images!.addAll(selectedImages);
      }else {
        print('No Images Selected ');
      }
    });
  }
}
