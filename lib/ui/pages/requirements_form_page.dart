import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/components/custom_textfield.dart';

class RequirementsFormPage extends StatelessWidget {
  const RequirementsFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RqrManx  ')),
      body: Container(
        child: Row(
          children: [CustomTextField(title: 'Requisito 1x')],
        ),
      ),
    );
  }
}
