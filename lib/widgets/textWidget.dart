import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  int fontSize;
  FontWeight fontWeight;
  bool isUnderLine;
  final Color color;
  final TextAlign ? align;

  TextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.align,
    this.isUnderLine=false,
    this.color= Colors.purpleAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
         top: 2,
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: isUnderLine?Color(0xFFB81F8F):Color(0xFFffffff),  // Text colour here
            width: 1.0, // Underline width
          ))
      ),

      child: Text(text,
        textAlign: align,
        style: TextStyle(
        fontSize:fontSize.toDouble(),
        fontFamily: 'Proxima Nova',
        color:color,

      ),),
    );
  }
}