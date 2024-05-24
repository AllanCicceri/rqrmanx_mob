import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/pages/projects_page.dart';
import 'package:rqr_manx/ui/pages/requirements_form_page.dart';
import 'package:rqr_manx/ui/pages/requirements_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[600],
              titleTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          textTheme: TextTheme(
              titleSmall: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                  fontWeight: FontWeight.w300))),
      initialRoute: '/projects_page',
      routes: {
        '/projects_page': (context) => ProjectsPage(),
        '/requirements_page': (context) => RequirementsPage(
              projectId: ModalRoute.of(context)!.settings.arguments as String,
            ),
        '/requirements_form_page': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map?;
          final projectId = args?['projectId'] as String?;
          final requirementId = args?['requirementId'] as String?;
          final refreshProjects = args?['refreshProjects'];

          return RequirementsFormPage(
            projectId: int.parse(projectId!),
            requirementId: int.parse(requirementId!),
            refreshProjects: refreshProjects,
          );
        },
      },
    );
  }
}
