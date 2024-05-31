import 'dart:io';

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
  String geolocation;
  File? image1;
  File? image2;

  RequirementsModel(
      {this.id = 0,
      required this.projectId,
      required this.name,
      required this.description,
      this.type = 0,
      this.priority = 0,
      this.difficulty = 0,
      this.hours = 1,
      this.geolocation = ""});

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
      'geolocation': geolocation,
      'image1': image1,
      'image2': image2,
    };
  }

  factory RequirementsModel.fromJson(Map<String, dynamic> json) {
    if (json == null || json.isEmpty) {
      // Retorna um JSON vazio
      return RequirementsModel(
        id: 0,
        projectId: 0,
        name: '',
        description: '',
        type: 0,
        priority: 0,
        difficulty: 0,
        hours: 0,
        geolocation: '',
      );
    }

    var model = RequirementsModel(
      id: json['id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? 0,
      priority: json['priority'] ?? 0,
      difficulty: json['difficulty'] ?? 0,
      hours: json['hours'] ?? 0,
      geolocation: json['geolocation'] ?? '',
    );

    List<int>? image1Bytes = json['image1'];
    String tempPath = Directory.systemTemp.path;
    File tempFile = File('$tempPath/temp_image.jpg');
    if (image1Bytes != null) {
      tempFile.writeAsBytesSync(image1Bytes);
      model.image1 = tempFile;
    }

    List<int>? image2Bytes = json['image2'];
    String tempPath2 = Directory.systemTemp.path;
    File tempFile2 = File('$tempPath2/temp_image.jpg');
    if (image2Bytes != null) {
      tempFile.writeAsBytesSync(image2Bytes);
      model.image2 = tempFile2;
    }

    ;

    return model;
  }

  File bytesToFile(List<int> bytes) {
    String tempPath = Directory.systemTemp.path;
    File tempFile = File('$tempPath/temp_image.jpg');
    tempFile.writeAsBytesSync(bytes);
    return tempFile;
  }
}
