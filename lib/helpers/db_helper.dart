import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uiproject/models/word.dart';

class DbHelper {
  static final DbHelper instance = DbHelper();

  DbHelper();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dictionary.db');
    return await openDatabase(
      path,
      version: 4,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE dictionary (
id INTEGER PRIMARY KEY AUTOINCREMENT,
turkish TEXT NOT NULL,
english TEXT NOT NULL,
favorite INTEGER NOT NULL DEFAULT 0,
image_path TEXT
)
''');
    await db.execute('''
CREATE TABLE history(
id INTEGER PRIMARY KEY AUTOINCREMENT,
word_query TEXT NOT NULL,
timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
)
''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2 && newVersion >= 2) {
      await db.execute('''
ALTER TABLE dictionary
ADD COLUMN favorite INTEGER NOT NULL DEFAULT 0
''');
    }
    if (oldVersion < 3 && newVersion >= 3) {
      await db.execute('''
CREATE TABLE history(
id INTEGER PRIMARY KEY AUTOINCREMENT,
word_query TEXT NOT NULL,
timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
)
''');
    }
    if (oldVersion < 4 && newVersion >= 4) {
      await db.execute('''
ALTER TABLE dictionary
ADD COLUMN image_path TEXT
''');
    }
  }

  Future<int> insertWord(Word word) async {
    Database db = await database;
    return await db.insert('dictionary', word.toMap());
  }

  Future<int> deleteWord(int id) async {
    Database db = await database;
    return db.delete('dictionary', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Word>> getAllWords() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dictionary');
    return List.generate(maps.length, (i) {
      return Word.fromMap(maps[i]);
    });
  }

  Future<List<Word>> searchWord(String query) async {
    Database db = await database;

    await db.insert('history', {'word_query': query});

    final List<Map<String, dynamic>> maps = await db.query(
      'dictionary',
      where: 'turkish LIKE ? OR english LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
    return List.generate(maps.length, (i) {
      return Word.fromMap(maps[i]);
    });
  }

  Future<int> updateFavoriteStatus(int id, bool isFavorite) async {
    Database db = await database;
    return await db.update(
      'dictionary',
      {'favorite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Word>> getFavoriteWords() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'dictionary',
      where: 'favorite = 1',
    );
    return List.generate(maps.length, (i) {
      return Word.fromMap(maps[i]);
    });
  }

  Future<List<Map<String, dynamic>>> getSearchHistory() async {
    Database db = await database;
    return await db.query('history', orderBy: 'timestamp DESC');
  }

  Future<void> clearSearchHistory() async {
    Database db = await database;
    await db.delete('history');
  }
}
