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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate.toIso8601String(),
      'finalDate': finalDate.toIso8601String(),
    };
  }
}
