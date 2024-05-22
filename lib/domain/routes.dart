import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/pages/projects_page.dart';
import 'package:rqr_manx/ui/pages/requirements_page.dart';

class Routes {
  static const String initialRoute = '/projects_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/projects_page': (context) => ProjectsPage(),
      '/requirements_page': (context) => RequirementsPage(),
    };
  }
}
