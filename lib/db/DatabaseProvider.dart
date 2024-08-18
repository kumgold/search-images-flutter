import 'package:search_images_flutter/db/model/LocalImage.dart';
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

  Future<bool> insertImage(LocalImage image) async {
    try {
      await _database.insert("image", image.toMap());
      print("insert success");
      return true;
    }
    catch (e) {
      print("insert failed");
      return false;
    }
  }

  Future<LocalImage> getImage(int id) async {
    var image = await _database.rawQuery("SELECT * FROM image WHERE id = $id");

    return image.first as LocalImage;
  }

  Future<List<LocalImage>> getImages() async {
    List<Map<String, dynamic>> maps = await _database.query("image");

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
    await _database.delete('image', where: "id = ?", whereArgs: [id]);
  }
}