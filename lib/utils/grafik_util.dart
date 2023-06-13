
// ignore_for_file: non_constant_identifier_names, camel_case_types, depend_on_referenced_packages

import 'package:film_uygulamasi/models/grafik_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Grafik_Util {
  static final Grafik_Util _dbUtils = Grafik_Util._internal();

  Grafik_Util._internal();

  factory Grafik_Util() {
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = p.join(await getDatabasesPath(), 'grafik.db');
    var grafik = await openDatabase(path, version: 1, onCreate: _createDb);
    return grafik;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE tbl_Grafik(name TEXT PRIMARY KEY,count int");
    await db.rawInsert(
      "INSERT INTO tbl_Grafik(name, count) VALUES('Black Adam', 15)",
    );
    await db.rawInsert(
      "INSERT INTO tbl_Grafik(name, count) VALUES('Moonfall', 54)",
    );
    await db.rawInsert(
      "INSERT INTO tbl_Grafik(name, count) VALUES('R.I.P.D.2', 16)",
    );
    await db.rawInsert(
      "INSERT INTO tbl_Grafik(name, count) VALUES('Venom', 13)",
    );
  }

  Future<void> grafik_Ekle(Grafik_Model grafik) async {
    final Database? db = await this.db;
    await db?.insert(
      'tbl_Grafik',
      grafik.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Grafik_Model>> grafik_Listele() async {
    final Database? db = await this.db;
    final List<Map<String, dynamic>>? maps = await db?.query('tbl_Grafik');

    return List.generate(maps!.length, (i) {
      return Grafik_Model(
        name: maps[i]['name'].toString(),
        count: maps[i]['count'],
      );
    });
  }

 Future<void> grafik_Guncelle(String name,int count) async
 {
   final db = await this.db;
   if (db != null) {
     db.update("tbl_Grafik",  {'count': count},
       where: 'name = ?',whereArgs: [name],
     );


   }
 }

  Future<bool> grafik_Varmi(String name) async {
    final db = await this.db;
    if (db != null) {
      var result = await db.query(
        "tbl_Grafik",
        columns: ["name"],
        where: "name = ?",
        whereArgs: [name],
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
