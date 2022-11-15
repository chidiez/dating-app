import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xFFB81F8F),
      content: Text(text, style: const TextStyle(color: Colors.white),),
    ),
  );
}
