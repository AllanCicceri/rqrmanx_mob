import 'package:flutter/material.dart';
import 'package:rqr_manx/domain/navigate_to.dart';

class AddRequirementButton extends StatelessWidget {
  final String projcetId;
  final Function refreshProjects;
  const AddRequirementButton(
      {super.key, required this.projcetId, required this.refreshProjects});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: RawMaterialButton(
        elevation: 5,
        onPressed: () {
          Navigate.toRequirementsFormPage(context,
              requirementProject: projcetId,
              requirementId: "0",
              refreshProjects: refreshProjects);
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
    ;
  }
}
