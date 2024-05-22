import 'package:flutter/material.dart';

class Navigate {
  static void toRequirementsPage(BuildContext context) {
    Navigator.pushNamed(context, '/requirements_page', arguments: []);
  }

  static void toRequirementsFormPage(BuildContext context) {
    Navigator.pushNamed(context, '/requirements_form_page', arguments: []);
  }
}
