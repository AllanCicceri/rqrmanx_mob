import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'rqrmanx.db');
    return await openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE projects (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, start_date DATETIME, final_date DATETIME)');
        await db.execute(
            'CREATE TABLE requirements (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, description VARCHAR, type INTEGER, start_date DATETIME, difficulty INTEGER, priority INTEGER, hours REAL, project_id INTEGER, geolocation VARCHAR, image1 BLOB, image2 BLOB, FOREIGN KEY (project_id) REFERENCES projects(id))');
      },
    );
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    Database db = await database;
    return await db.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data, int id) async {
    Database db = await database;
    return await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    Database db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllItems(String table, {String? where}) async {
    Database db = await database;
    if (where != null) {
      await db.delete(table, where: where);
    } else {
      await db.delete(table);
    }
  }
}
