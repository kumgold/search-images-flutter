import 'package:path/path.dart';
import 'package:search_images_flutter/db/model/LocalImage.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await init();
    return _database!;
  }

  Future<Database> init() async {
    String path = join(await getDatabasesPath(), "images.db");

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

  Future<bool> insertImage(LocalImage image) async {
    try {
      final db = await DatabaseProvider().database;
      await db.insert("images", image.toMap());
      print("insert success");
      return true;
    }
    catch (e) {
      print("insert failed");
      return false;
    }
  }

  Future<LocalImage> getImage(int id) async {
    final db = await DatabaseProvider().database;
    var image = await db.rawQuery("SELECT * FROM images WHERE id = $id");

    return image.first as LocalImage;
  }

  Future<List<LocalImage>> getImages() async {
    final db = await DatabaseProvider().database;
    List<Map<String, dynamic>> maps = await db.query("images");

    return List.generate(maps.length, (index) {
      return LocalImage(
        id: maps[index]["id"],
        imageUrl: maps[index]["imageUrl"],
        docUrl: maps[index]["docUrl"],
        datetime: maps[index]["datetime"]
      );
    });
  }

  Future<void> deleteImage(int id) async {
    await _database!.delete('images', where: "id = ?", whereArgs: [id]);
  }

  Future close() async {
    final db = await DatabaseProvider().database;
    db.close();
  }
}