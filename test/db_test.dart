import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:fwallet/db/db.dart';

void main() {
  setUpAll(() {
    // Initialize sqflite for ffi
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('delete', () async {
    // 打开数据库
    var database = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
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
    ''');
    });
    // 插入4个wallet
    await database.insert('Wallet', {'type': 1, 'name': 'Wallet1'});
    await database.insert('Wallet', {'type': 1, 'name': 'Wallet2'});
    await database.insert('Wallet', {'type': 1, 'name': 'Wallet3'});
    await database.insert('Wallet', {'type': 1, 'name': 'Wallet4'});

    // 删除id为4的wallet
    await database.delete('Wallet', where: 'id = ?', whereArgs: [4]);
    // 插入新的wallet
    await database.insert('Wallet', {'type': 1, 'name': 'Wallet5'});
    // 查询所有wallet
    // List<Map> wallets = await database.query('Wallet');
    // print(wallets.toString()); // 使用 logging 框架替代 print
  });

  test('Database initialization', () async {
    DatabaseHelper dbHelper = DatabaseHelper();
    Database db = await dbHelper.database;
    expect(db, isNotNull);
  });

  test('Table creation', () async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> tables = await dbHelper.getAllTables();
    expect(tables.any((table) => table['name'] == 'Wallet'), isTrue);
    expect(tables.any((table) => table['name'] == 'Coin'), isTrue);
    expect(tables.any((table) => table['name'] == 'Contacts'), isTrue);
  });

  test('Data insertion and query', () async {
    DatabaseHelper dbHelper = DatabaseHelper();
    Database db = await dbHelper.database;

    // Insert data into Wallet table
    await db.insert('Wallet', {'type': 1, 'name': 'Test Wallet'});
    await db.insert('Wallet', {'type': 1, 'name': 'Test Wallet'});
    await db.insert('Wallet', {'type': 1, 'name': 'Test Wallet'});
    await db.insert('Wallet', {'type': 1, 'name': 'Test Wallet'});
    await db.insert('Wallet', {'type': 1, 'name': 'Test Wallet'});

    await db.delete('Wallet', where: 'id = ?', whereArgs: [5]);
    await db.insert('Wallet', {'type': 1, 'name': 'Test Wallet'});

    List<Map<String, dynamic>> wallets = await db.query('Wallet');
    expect(wallets.length, 1);
    expect(wallets.first['name'], 'Test Wallet');

    // Insert data into Coin table
    await db.insert('Coin', {'pwalletId': 1, 'address': 'Test Address'});
    List<Map<String, dynamic>> coins = await db.query('Coin');
    expect(coins.length, 1);
    expect(coins.first['address'], 'Test Address');

    // Insert data into Contacts table
    await db.insert('Contacts', {'walletId': 1, 'name': 'Test Contact'});
    List<Map<String, dynamic>> contacts = await db.query('Contacts');
    expect(contacts.length, 1);
    expect(contacts.first['name'], 'Test Contact');
  });

  test('Database upgrade', () async {
    // Simulate database upgrade
    DatabaseHelper dbHelper = DatabaseHelper();
    Database db = await dbHelper.database;
    await db.execute('ALTER TABLE Coin ADD balance TEXT');
    List<Map<String, dynamic>> coins = await db.query('Coin');
    expect(coins.first.containsKey('balance'), isTrue);
  });
}
