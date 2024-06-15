class UserModel {
  int id;
  String name;
  String password;

  UserModel({
    this.id = 0,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
