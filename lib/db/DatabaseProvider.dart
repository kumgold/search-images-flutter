import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  late Database _database;

  Future<Database?> get database async {
    _database = await init();
    return _database;
  }

  Future<Database> init() async {
    String path = join(await getDatabasesPath(), "image.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute("""
          CREATE TABLE images(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            imageUrl TEXT,
            docUrl TEXT,
            datetime TEXT
          )
        """);
      }
    );
  }
}