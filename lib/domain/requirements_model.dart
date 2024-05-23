class RequirementsModel {
  int id;
  String name;
  String description;
  int type;
  int priority;
  int dificult;
  double hours;
  DateTime created = DateTime.now();

  RequirementsModel({
    this.id = 0,
    required this.name,
    required this.description,
    this.type = 0,
    this.priority = -1,
    this.dificult = -1,
    this.hours = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'priority': priority,
      'dificult': dificult,
      'hours': hours,
      'created': created.toIso8601String(),
    };
  }
}
