import 'package:flutter/material.dart';
import 'package:rqr_manx/ui/pages/home_page.dart';
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
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    ProjectsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      routes: {
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RqrManx'),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: 'Cadastros',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}
