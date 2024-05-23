import 'package:rqr_manx/data/sqlite.dart';
import 'package:rqr_manx/domain/requirements_model.dart';
import 'package:sqflite/sqflite.dart';

class RequirementsRepository {
  static insert(RequirementsModel model) {
    DatabaseHelper db = DatabaseHelper();
    db.insert('requirements', model.toJson());
  }

  static update(RequirementsModel model) {
    DatabaseHelper db = DatabaseHelper();
    db.update('requirements', model.toJson(), model.id);
  }

  static delete(int id) {
    DatabaseHelper db = DatabaseHelper();
    db.delete('requirements', id);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    DatabaseHelper db = DatabaseHelper();
    var requirements = db.query('requirements');
    return requirements;
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
