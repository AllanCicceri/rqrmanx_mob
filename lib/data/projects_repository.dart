import 'package:rqr_manx/data/sqlite.dart';
import 'package:rqr_manx/domain/project_model.dart';
import 'package:sqflite/sqflite.dart';

class ProjectsRepository {
  static insert(ProjectModel model) {
    DatabaseHelper db = DatabaseHelper();
    db.insert('projects', model.toJson());
  }

  static update(ProjectModel model) {
    DatabaseHelper db = DatabaseHelper();
    db.update('projects', model.toJson(), model.id);
  }

  static delete(int id) {
    DatabaseHelper db = DatabaseHelper();
    db.delete('projects', id);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    DatabaseHelper db = DatabaseHelper();
    var projects = db.query('projects');
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
}
