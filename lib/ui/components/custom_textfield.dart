import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final title;
  final maxLines;
  final controller;
  const CustomTextField(
      {super.key, required this.title, this.maxLines = 1, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
            // contentPadding: EdgeInsets.symmetric(vertical: 20),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!))));
  }
}
