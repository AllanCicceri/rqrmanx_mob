import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/components/form_dialog.dart';

class AddProjectButton extends StatelessWidget {
  const AddProjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: RawMaterialButton(
        elevation: 5,
        onPressed: () {
          FormDialog.show(context);
        },
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
  }
}

// Future<void> _showForm(BuildContext context) async {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController startDateController = TextEditingController();
//   final TextEditingController endDateController = TextEditingController();

//   await showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('New Project'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: startDateController,
//               decoration: InputDecoration(labelText: 'Start Date'),
//               onTap: () async {
//                 FocusScope.of(context).requestFocus(new FocusNode());
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   startDateController.text =
//                       "${pickedDate.toLocal()}".split(' ')[0];
//                 }
//               },
//             ),
//             TextFormField(
//               controller: endDateController,
//               decoration: InputDecoration(labelText: 'End Date'),
//               onTap: () async {
//                 FocusScope.of(context).requestFocus(new FocusNode());
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   endDateController.text =
//                       "${pickedDate.toLocal()}".split(' ')[0];
//                 }
//               },
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // Process the data here
//               String name = nameController.text;
//               String startDate = startDateController.text;
//               String endDate = endDateController.text;
//               print('Name: $name');
//               print('Start Date: $startDate');
//               print('End Date: $endDate');
//               Navigator.of(context).pop();
//             },
//             child: Text('Save'),
//           ),
//         ],
//       );
//     },
//   );
// }
