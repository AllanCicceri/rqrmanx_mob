class RequirementsModel {
  int id;
  int projectId;
  String name;
  String description;
  int type;
  int priority;
  int difficulty;
  double hours;
  String startDate = DateTime.now().toString();

  RequirementsModel({
    this.id = 0,
    required this.projectId,
    required this.name,
    required this.description,
    this.type = 0,
    this.priority = 0,
    this.difficulty = 0,
    this.hours = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project_id': projectId,
      'name': name,
      'description': description,
      'type': type,
      'priority': priority,
      'difficulty': difficulty,
      'hours': hours,
      'start_date': startDate,
    };
  }

  factory RequirementsModel.fromJson(Map<String, dynamic> json) {
    var model = RequirementsModel(
      id: json['id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? 0,
      priority: json['priority'] ?? 0,
      difficulty: json['difficulty'] ?? 0,
      hours: json['hours'] ?? 0,
    );

    model.startDate = json['start_date'];

    return model;
  }
}
