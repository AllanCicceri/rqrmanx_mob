import 'package:flutter/material.dart';
import 'package:rqr_manx/data/projects_repository.dart';
import 'package:rqr_manx/data/requirements_repository.dart';
import 'package:rqr_manx/domain/navigate_to.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int countProjects;
  late int countRequirements;

  @override
  void initState() {
    _loadStatistics();
    super.initState();
  }

  void _loadStatistics() async {
    int projectsCount = await ProjectsRepository.count();
    int requirementsCount = await RequirementsRepository.count();
    setState(() {
      countProjects = projectsCount;
      countRequirements = requirementsCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You have $countProjects ${countProjects > 1 ? 'projects' : 'project'} \nAnd $countRequirements ${countRequirements > 1 ? 'Requirements' : 'Requirement'}',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
