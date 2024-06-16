import 'package:rqr_manx/data/sqlite.dart';
import 'package:rqr_manx/domain/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UsersRepository {
  static Future<String> getByNameAndPass(String name, String pass) async {
    DatabaseHelper db = DatabaseHelper();
    Database database = await db.database;
    List<Map<String, dynamic>> results = await database.query(
      'users',
      where: 'name = ? And password= ?',
      whereArgs: [name, pass],
    );

    if (results.isNotEmpty) {
      return results.first['name'];
    } else {
      return "";
    }
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    DatabaseHelper db = DatabaseHelper();
    Database database = await db.database;
    List<Map<String, dynamic>> users =
        await database.query('users', columns: ['id', 'name']);
    return users;
  }

  static void insert(UserModel model) async {
    DatabaseHelper db = DatabaseHelper();
    var data = model.toJson();
    data.remove('id');
    await db.insert('users', data);
  }

  static delete(int id) {
    DatabaseHelper db = DatabaseHelper();
    db.delete('users', id);
  }
}
