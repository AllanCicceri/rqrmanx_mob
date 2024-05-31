import 'package:flutter/material.dart';

class Navigate {
  static void toRequirementsPage(BuildContext context, String projectId) {
    Navigator.pushNamed(context, '/requirements_page', arguments: projectId);
  }

  static void toRequirementsFormPage(BuildContext context,
      {String? requirementId = "0",
      required String requirementProject,
      required Function refreshProjects}) {
    Navigator.pushNamed(
      context,
      '/requirements_form_page',
      arguments: {
        'requirementId': requirementId,
        'projectId': requirementProject,
        'refreshProjects': refreshProjects
      },
    );
  }

  static void toHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home_page');
  }

  static void toProjectsPage(BuildContext context) {
    Navigator.pushNamed(context, '/projects_page');
  }
}
