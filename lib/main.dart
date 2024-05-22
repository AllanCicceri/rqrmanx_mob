import 'package:flutter/material.dart';
import 'package:rqr_manx/domain/routes.dart';
import 'package:rqr_manx/ui/pages/projects_page.dart';

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
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          textTheme: TextTheme(
              titleSmall: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                  fontWeight: FontWeight.w300))),
      home: ProjectsPage(),
    );
  }
}
