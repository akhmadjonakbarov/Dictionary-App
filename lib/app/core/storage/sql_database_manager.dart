import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../shared/models/word.dart';
import '../data/constants_data.dart';

class SQLDatabaseManager {
  static const String _tableName = 'words';

  // Singleton instance
  static final SQLDatabaseManager _instance = SQLDatabaseManager._internal();

  factory SQLDatabaseManager() => _instance;

  // Private constructor
  SQLDatabaseManager._internal();

  // Database instance
  Database? _database;

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
           CREATE TABLE levels (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
           )        
          ''');
        for (var level in levels) {
          await db.insert('levels', {'name': level});
        }
        await db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              category TEXT,
              level INTEGER,
              key TEXT,
              value TEXT,
              image TEXT,
             FOREIGN KEY (level) REFERENCES levels(id) ON DELETE CASCADE
            )
          ''');
        await db.execute('''
        CREATE TABLE learnt_words (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              word TEXT
            )
        ''');
      },
    );
  }

  Future<int> insertWord(Word word) async {
    final db = await database;
    return await db.insert(_tableName, word.toMap());
  }

  Future<int> insertLearntWord(String word) async {
    final db = await database;
    return await db.insert('learnt_words', {'word': word});
  }

  Future<List<String>> getLearnedWordIds() async {
    final db = await database;
    return (await db.query('learnt_words'))
        .map(
          (e) => e['word'].toString(),
        )
        .toList();
  }

  Future<List<Word>> getAllWords() async {
    final db = await database;
    return (await db.query(_tableName))
        .map((row) => Word.fromMap(row))
        .toList();
  }

  Future<void> deleteWord(int id) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
