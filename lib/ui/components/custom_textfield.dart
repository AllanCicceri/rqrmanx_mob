import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final title;
  const CustomTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
          decoration: InputDecoration(
        labelText: title,
        // border: OutlineInputBorder(),
      )),
    );
  }
}
