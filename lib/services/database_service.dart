import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/models.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static DatabaseService get instance => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dailybox.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // User Activities table
    await db.execute('''
      CREATE TABLE user_activities(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        latitude REAL,
        longitude REAL,
        timestamp INTEGER NOT NULL
      )
    ''');

    // Notes table
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        timestamp INTEGER NOT NULL,
        latitude REAL,
        longitude REAL
      )
    ''');

    // Budget entries table
    await db.execute('''
      CREATE TABLE budget_entries(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        type TEXT NOT NULL,
        category TEXT NOT NULL,
        date TEXT NOT NULL,
        latitude REAL,
        longitude REAL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Future database schema changes will go here
  }

  // Notes methods
  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Budget methods
  Future<List<BudgetEntry>> getAllBudgetEntries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('budget_entries');
    return List.generate(maps.length, (i) {
      return BudgetEntry.fromMap(maps[i]);
    });
  }

  Future<int> insertBudgetEntry(BudgetEntry entry) async {
    final db = await database;
    return await db.insert('budget_entries', entry.toMap());
  }

  Future<int> deleteBudgetEntry(int id) async {
    final db = await database;
    return await db.delete(
      'budget_entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // User Activity methods
  Future<List<UserActivity>> getAllActivities() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user_activities');
    return List.generate(maps.length, (i) {
      return UserActivity.fromMap(maps[i]);
    });
  }

  Future<List<UserActivity>> getActivitiesByType(String type) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'user_activities',
      where: 'type = ?',
      whereArgs: [type],
    );
    return List.generate(maps.length, (i) {
      return UserActivity.fromMap(maps[i]);
    });
  }

  Future<int> insertActivity(UserActivity activity) async {
    final db = await database;
    return await db.insert('user_activities', activity.toMap());
  }
}