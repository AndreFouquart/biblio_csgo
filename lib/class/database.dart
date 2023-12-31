import 'package:biblio_csgo/class/skin.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DataBaseCSGO {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'csgo.db'),
      onCreate: (db, version) {},
      version: 1,
    );
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS inventaire(id TEXT PRIMARY KEY, name TEXT, image TEXT, minFloat FLOAT, maxFloat FLOAT)''');
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS favoris(id TEXT PRIMARY KEY, name TEXT, image TEXT, minFloat FLOAT, maxFloat FLOAT)''');
    return db;
  }

  Future<void> insertSkinInventory(Skin skin) async {
    // Get a reference to the database.
    final db = await this.db;

    await db!.insert(
      'inventaire',
      skin.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteInventaireSkin(String id) async {
    final db = await this.db;

    await db!.delete(
      'inventaire',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Skin>> afficheSkin() async {
    final db = await _db;

    final List<Map<String, dynamic>> maps = await db!.query('inventaire');

    return List.generate(maps.length, (i) {
      return Skin(
        maps[i]['id'] as String,
        maps[i]['name'] as String,
        maps[i]['image'] as String,
        maps[i]['minFloat'] as double,
        maps[i]['maxFloat'] as double,
      );
    });
  }
}