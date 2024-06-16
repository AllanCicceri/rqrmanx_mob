class ProjectModel {
  int id;
  String name;
  String startDate;
  String finalDate;
  String link;

  ProjectModel(
      {this.id = 0,
      required this.name,
      required this.startDate,
      required this.finalDate,
      this.link = ""});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate,
      'final_date': finalDate,
      'link': link
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      startDate: json['start_date'] ?? '',
      finalDate: json['final_date'] ?? '',
      link: json['link'] ?? '',
    );
  }
}
