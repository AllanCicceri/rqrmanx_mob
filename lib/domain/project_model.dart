class ProjectModel {
  int id;
  String name;
  DateTime startDate;
  DateTime finalDate;

  ProjectModel(
      {this.id = 0,
      required this.name,
      required this.startDate,
      required this.finalDate});
}
