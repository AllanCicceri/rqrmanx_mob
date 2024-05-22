import 'package:flutter/material.dart';

class AddRequirementButton extends StatelessWidget {
  const AddRequirementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: RawMaterialButton(
        elevation: 5,
        onPressed: () {},
        fillColor: Colors.red[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3), // Remove o border radius
        ),
        child: const Text(
          'New',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
    ;
  }
}
