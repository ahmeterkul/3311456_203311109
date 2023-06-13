// ignore_for_file: non_constant_identifier_names, camel_case_types, depend_on_referenced_packages

import 'package:film_uygulamasi/models/favoriler_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Favori_Utils {
  static final Favori_Utils _dbUtils = Favori_Utils._internal();

  Favori_Utils._internal();

  factory Favori_Utils() {
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = p.join(await getDatabasesPath(), 'favoriler.db');
    var favoriler = await openDatabase(path, version: 1, onCreate: _createDb);
    return favoriler;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE tbl_Favoriler(film_ismi TEXT PRIMARY KEY,link TEXT, aciklama TEXT)");
  }

  Future<void> favori_Ekle(Favori favori) async {
    final Database? db = await this.db;
    await db?.insert(
      'tbl_Favoriler',
      favori.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Favori>> favorileri_Listele() async {
    final Database? db = await this.db;
    final List<Map<String, Object?>>? maps = await db?.query('tbl_Favoriler');

    return List.generate(maps!.length, (i) {
      return Favori(
        film_ismi: maps[i]['film_ismi'].toString(),
        link: maps[i]['link'].toString(),
        aciklama: maps[i]['aciklama'].toString(),
      );
    });
  }

  Future<void> favori_Sil(String film_ismi) async {
    final db = await this.db;
    await db?.delete(
      'tbl_Favoriler',
      where: "film_ismi = ?",
      whereArgs: [film_ismi],
    );
  }

  Future<bool> favoriVarmi(String film_ismi) async {
    final db = await this.db;
    if (db != null) {
      var result = await db.query(
        "tbl_Favoriler",
        columns: ["film_ismi"],
        where: "film_ismi = ?",
        whereArgs: [film_ismi],
      );

      if (result.isNotEmpty) {
        return true;

      } else {
        return false;

      }
    } else {
      throw Exception("Veritabanına erişilemiyor.");
    }
  }
}
