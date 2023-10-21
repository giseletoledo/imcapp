import 'package:imcapp/imc_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class IMCDatabase {
  static final IMCDatabase _instance = IMCDatabase.internal();
  factory IMCDatabase() => _instance;

  static Database? _db;

  IMCDatabase.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'imc_database.db');

    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE imc_table (
        id INTEGER PRIMARY KEY,
        peso REAL,
        altura REAL
      )
    ''');
  }

  Future<int> saveIMC(IMCModel imcModel) async {
    var dbClient = await db;
    int res;
    if (imcModel.id == null) {
      res = await dbClient.insert('imc_table', imcModel.toMap());
    } else {
      res = await dbClient.update('imc_table', imcModel.toMap(),
          where: 'id = ?', whereArgs: [imcModel.id]);
    }
    return res;
  }

  Future<List<IMCModel>> loadAllIMC() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM imc_table');
    List<IMCModel> items = [];
    for (var item in list) {
      items.add(IMCModel.fromMap(item));
    }
    return items;
  }
}
