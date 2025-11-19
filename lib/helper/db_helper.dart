import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'movie.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE movie(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            name TEXT,
            rating REAL,
            category TEXT
          )
          ''');
      },
    );
  }

  Future<int> markMovie(Map<String, dynamic> movie) async {
    final client = await db;
    return await client.insert('movie', movie);
  }

  Future<int> deleteMovie(int id) async {
    final client = await db;
    return await client.delete('movie', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getMarkedMovie() async {
    final client = await db;
    return await client.query('movie');
  }
}
