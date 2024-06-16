import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/components/custom_webview.dart';
import 'package:rqr_manx/ui/pages/home_page.dart';
import 'package:rqr_manx/ui/pages/login_page.dart';
import 'package:rqr_manx/ui/pages/main_page.dart';
import 'package:rqr_manx/ui/pages/projects_page.dart';
import 'package:rqr_manx/ui/pages/requirements_form_page.dart';
import 'package:rqr_manx/ui/pages/requirements_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[600],
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          textTheme: TextTheme(
            titleSmall: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        initialRoute: '/login_page',
        routes: {
          '/webview_page': (context) => CustomWebview(
                url: ModalRoute.of(context)!.settings.arguments as String,
              ),
          '/login_page': (context) => LoginPage(),
          '/main_page': (context) => MainPage(),
          '/home_page': (context) => HomePage(),
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
        home: MainPage());
  }
}
