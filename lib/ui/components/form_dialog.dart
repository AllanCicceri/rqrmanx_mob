import 'package:flutter/material.dart';

class FormDialog {
  static Future<void> show(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: startDateController,
                decoration: InputDecoration(labelText: 'Start Date'),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    startDateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              TextFormField(
                controller: endDateController,
                decoration: InputDecoration(labelText: 'End Date'),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    endDateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Process the data here
                String name = nameController.text;
                String startDate = startDateController.text;
                String endDate = endDateController.text;
                print('Name: $name');
                print('Start Date: $startDate');
                print('End Date: $endDate');
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
