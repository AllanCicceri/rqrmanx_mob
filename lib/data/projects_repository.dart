import 'package:rqr_manx/data/sqlite.dart';
import 'package:rqr_manx/domain/project_model.dart';
import 'package:sqflite/sqflite.dart';

class ProjectsRepository {
  static void insert(ProjectModel model) async {
    DatabaseHelper db = DatabaseHelper();
    var data = model.toJson();
    data.remove('id');
    await db.insert('projects', data);
  }

  static void update(ProjectModel model) async {
    DatabaseHelper db = DatabaseHelper();
    await db.update('projects', model.toJson(), model.id);
  }

  static delete(int id) {
    DatabaseHelper db = DatabaseHelper();
    db.delete('projects', id);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    DatabaseHelper db = DatabaseHelper();
    var projects = await db.query('projects');
    return projects;
  }

  static Future<Map<String, dynamic>> getById(int id) async {
    DatabaseHelper db = DatabaseHelper();
    Database database = await db.database;
    List<Map<String, dynamic>> results = await database.query(
      'projects',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  static Future<int> count() async {
    List<Map<String, dynamic>> projects = await ProjectsRepository.getAll();
    return projects.length;
  }
}
