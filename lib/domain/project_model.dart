class ProjectModel {
  int id;
  String name;
  String startDate;
  String finalDate;

  ProjectModel(
      {this.id = 0,
      required this.name,
      required this.startDate,
      required this.finalDate});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate,
      'final_date': finalDate,
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      startDate: json['start_date'] ?? '',
      finalDate: json['final_date'] ?? '',
    );
  }
}
