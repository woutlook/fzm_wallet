import 'package:fwallet/utils/app_utils.dart';
import 'package:sqflite/sqflite.dart';

//在Flutter中，创建表时可以使用以下数据类型：
//
// INTEGER：整数类型，可以存储整数值。
// REAL：浮点数类型，可以存储浮点数值。
// TEXT：文本类型，可以存储字符串值。
// BLOB：二进制类型，可以存储任意二进制数据。
// 此外，还可以使用以下修饰符来定义表中的列：
//
// PRIMARY KEY：主键修饰符，用于指定列作为主键。
// AUTOINCREMENT：自增修饰符，用于指定主键列自动增加。
// NOT NULL：非空修饰符，用于指定列的值不能为空。
// UNIQUE：唯一修饰符，用于指定列的值不能重复。
// 以下是一个示例代码，展示了如何在Flutter中创建一个包含不同数据类型的表：
//
// 复制代码
// await db.execute('''
//   CREATE TABLE students (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     name TEXT NOT NULL,
//     age INTEGER,
//     gpa REAL
//   )
// ''');

// 以上代码创建了一个名为"students"的表

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'wallet31.db';
  static const int _dbVersion = 2;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(_dbName, version: _dbVersion,
        onCreate: (db, version) async {
      String walletSQL = '''
      CREATE TABLE Wallet(
      id INTEGER PRIMARY KEY,
      type INTEGER,
      name TEXT,
      password TEXT,
      mnem TEXT,
      mnemType INTEGER,
      privKey TEXT,
      chain TEXT,
      platform TEXT
      )
      ''';
      String coinSQL = '''
      CREATE TABLE Coin(
      id INTEGER PRIMARY KEY,
      pwalletId INTEGER,
      address TEXT,
      pubkey TEXT,
      privkey TEXT,
      contract TEXT,
      icon TEXT,
      name TEXT,
      nickname TEXT,
      platform TEXT,
      chain TEXT,
      treaty TEXT,
      netId INTEGER,
      balance TEXT,
      added INTEGER
      )
      ''';
      String contactsSQL = '''
      CREATE TABLE Contacts(
      id INTEGER PRIMARY KEY,
      walletId INTEGER,
      name TEXT,
      phoneNum TEXT,
      coinId TEXT,
      address TEXT
      )
      ''';

      await db.execute(walletSQL);
      await db.execute(coinSQL);
      await db.execute(contactsSQL);
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion == 1 && newVersion == 2) {
        await db.execute('ALTER TABLE Coin ADD balance TEXT');
      }
    });
  }

  Future<List<Map<String, dynamic>>> getAllTables() async {
    final Database db = await database;
    return db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
  }

  // 测试
  test() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    List<Map<String, dynamic>> tables = await databaseHelper.getAllTables();
    for (var table in tables) {
      Log.i("当前数据中的表：${table['name']}");
    }
  }
}
