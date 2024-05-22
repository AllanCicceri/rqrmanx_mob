import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/components/custom_dropdown.dart';
import 'package:rqr_manx/ui/components/custom_textfield.dart';
import 'package:rqr_manx/ui/components/save_button.dart';

class RequirementsFormPage extends StatelessWidget {
  const RequirementsFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RqrManx  ')),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(title: 'Name'),
            CustomTextField(
              title: 'Description',
              maxLines: 4,
            ),
            SizedBox(height: 20),
            SizedBox(width: 100, child: CustomTextField(title: 'Hours')),
            SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomDropdown(
                  label: 'Difficulty Level', items: ['low', 'medium', 'high']),
              CustomDropdown(
                  label: 'Priority Level', items: ['low', 'medium', 'high']),
            ]),
          ],
        ),
      ),
      floatingActionButton: const SaveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
