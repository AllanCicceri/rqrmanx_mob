import 'package:rqr_manx/data/sqlite.dart';
import 'package:rqr_manx/domain/requirements_model.dart';
import 'package:sqflite/sqflite.dart';

class RequirementsRepository {
  static insert(RequirementsModel model) async {
    DatabaseHelper db = DatabaseHelper();
    var data = model.toJson();
    data.remove('id');
    await db.insert('requirements', data);
  }

  static update(RequirementsModel model) async {
    DatabaseHelper db = DatabaseHelper();
    await db.update('requirements', model.toJson(), model.id);
  }

  static delete(int id) {
    DatabaseHelper db = DatabaseHelper();
    db.delete('requirements', id);
  }

  static Future<List<Map<String, dynamic>>> getAll(String projectId) async {
    DatabaseHelper db = DatabaseHelper();
    Database database = await db.database;
    List<Map<String, dynamic>> results = await database.query(
      'requirements',
      where: 'project_id = ?',
      whereArgs: [projectId],
    );

    if (results.isNotEmpty) {
      return results;
    } else {
      return [{}];
    }
  }

  static Future<Map<String, dynamic>> getById(int id, int projectId) async {
    DatabaseHelper db = DatabaseHelper();
    Database database = await db.database;
    List<Map<String, dynamic>> results = await database.query(
      'requirements',
      where: 'id = ? AND project_id = ?',
      whereArgs: [id, projectId],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }
}
