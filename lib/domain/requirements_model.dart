class RequirementsModel {
  int id;
  String name;
  String description;
  int priority;
  int dificult;
  double hours;
  DateTime created = DateTime.now();

  RequirementsModel({
    this.id = 0,
    required this.name,
    required this.description,
    this.priority = -1,
    this.dificult = -1,
    this.hours = 1,
  });
}
