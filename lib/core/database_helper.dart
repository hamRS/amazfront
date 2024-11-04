import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class AmazFrontDataBaseHelper {
  static final AmazFrontDataBaseHelper instance =
      AmazFrontDataBaseHelper._internal();

  static Database? _database;

  AmazFrontDataBaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'amazfront.db'),
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    //// Si creas otras tablas pones aca alelu
    await db.execute('''
        'CREATE TABLE CATEGORY(id TEXT PRIMARY KEY, name TEXT)'
      ''');
    await db.execute('''
      CREATE TABLE PRODUCT(
        idProducto TEXT PRIMARY KEY,
        nombre TEXT,
        precioVenta REAL,
        categoriaId TEXT,
        FOREIGN KEY (categoriaId) REFERENCES CATEGORY(id)
      )
    ''');
    return;
  }
}
