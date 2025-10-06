import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/models.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
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
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
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

    await db.execute('''
      CREATE TABLE budget_entries(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        currency TEXT NOT NULL,
        amount REAL NOT NULL,
        description TEXT NOT NULL,
        is_income INTEGER NOT NULL,
        timestamp INTEGER NOT NULL,
        latitude REAL,
        longitude REAL
      )
    ''');
  }

  // User Activities
  Future<int> insertActivity(UserActivity activity) async {
    final db = await database;
    return await db.insert('user_activities', activity.toMap());
  }

  Future<List<UserActivity>> getAllActivities() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user_activities',
        orderBy: 'timestamp DESC');
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
      orderBy: 'timestamp DESC',
    );
    return List.generate(maps.length, (i) {
      return UserActivity.fromMap(maps[i]);
    });
  }

  // Notes
  Future<int> insertNote(Note note) async {
    final db = await database;
    final id = await db.insert('notes', note.toMap());
    
    // Also insert as activity
    await insertActivity(UserActivity(
      type: ActivityType.note,
      title: note.title,
      content: note.content,
      latitude: note.latitude,
      longitude: note.longitude,
      timestamp: note.timestamp,
    ));
    
    return id;
  }

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes',
        orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
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

  // Budget Entries
  Future<int> insertBudgetEntry(BudgetEntry entry) async {
    final db = await database;
    final id = await db.insert('budget_entries', entry.toMap());
    
    // Also insert as activity
    await insertActivity(UserActivity(
      type: ActivityType.budget,
      title: '${entry.isIncome ? '+' : '-'}${entry.amount} ${entry.currency}',
      content: entry.description,
      latitude: entry.latitude,
      longitude: entry.longitude,
      timestamp: entry.timestamp,
    ));
    
    return id;
  }

  Future<List<BudgetEntry>> getAllBudgetEntries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('budget_entries',
        orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) {
      return BudgetEntry.fromMap(maps[i]);
    });
  }

  Future<Map<String, double>> getBudgetSummary() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT currency, 
             SUM(CASE WHEN is_income = 1 THEN amount ELSE 0 END) as income,
             SUM(CASE WHEN is_income = 0 THEN amount ELSE 0 END) as expense,
             SUM(CASE WHEN is_income = 1 THEN amount ELSE -amount END) as balance
      FROM budget_entries 
      GROUP BY currency
    ''');
    
    Map<String, double> summary = {};
    for (var result in results) {
      summary['${result['currency']}_balance'] = result['balance'];
      summary['${result['currency']}_income'] = result['income'];
      summary['${result['currency']}_expense'] = result['expense'];
    }
    
    return summary;
  }

  Future<int> deleteBudgetEntry(int id) async {
    final db = await database;
    return await db.delete(
      'budget_entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}