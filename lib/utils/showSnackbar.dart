import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.pinkAccent,
      content: Text(text, style: const TextStyle(color: Colors.black),),
    ),
  );
}
