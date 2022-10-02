import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextInput extends StatefulWidget {
  final String textString;
  TextEditingController textController;
  final bool obscureText;
  final Widget ? widget;
  TextInputType keyboardType;

  TextInput({
    Key? key,
    required this.textString,
    required this.textController,
    this.widget,
    required this.keyboardType,
    required this.obscureText,
    AutovalidateMode ? autoValidateMode,
    String? Function(dynamic email) ? validator
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFF000000), fontFamily: 'Proxima Nova',),
      cursorColor: Color(0xFF9b9b9b),
      controller: widget.textController,
      keyboardType: TextInputType.text,
      obscureText: widget.obscureText! ? _isObscure : false,
      decoration: InputDecoration(
        hintText: widget.textString,
        suffixIcon: widget.obscureText! ? IconButton(
          onPressed: (){
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),) : null,
        hintStyle: TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.normal),
      ),
    );
  }
}