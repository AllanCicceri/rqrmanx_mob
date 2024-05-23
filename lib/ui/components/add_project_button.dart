import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/components/form_dialog.dart';

class AddProjectButton extends StatelessWidget {
  final void Function(BuildContext context) onClick;

  const AddProjectButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: RawMaterialButton(
        elevation: 5,
        onPressed: () => onClick(context),
        // FormDialog.show(context, null);

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
