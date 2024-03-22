import 'dart:async';
import 'package:elocalize/domain/model/book_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = [await getDatabasesPath(), 'books_database.db'].join();
    return openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE Books (
        id INTEGER PRIMARY KEY,
        title TEXT,
        author TEXT,
        description TEXT,
        field INTEGER
      )
      ''');
  }

  Future<int> addBook(BookModel book) async {
    final db = await database;
    return await db.insert('Books', book.toMap());
  }

  Future<List<BookModel>> getBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Books');
    List<BookModel> books = [];
    Future.forEach(maps, (book) {
      int id = book['id'] ?? -1;
      String description = book['description'] ?? '-1';
      books.add(BookModel(
        id: id,
        book['title'],
        book['author'],
        description,
        book['field'],
      ));
    });
    return books;
  }

  Future<int> removeBook(int id) async {
    final db = await database;
    return await db.delete(
      'Books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<BookModel>> searchBooks(String query) async {
    if (query.isEmpty) {
      return [];
    }
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Books',
      where: "title LIKE ?",
      whereArgs: ['%$query%'],
    );
    List<BookModel> searchResult = [];
    Future.forEach(maps, (book) {
      int id = book['id'] ?? -1;
      String description = book['description'] ?? '-1';

      searchResult.add(BookModel(
        id: id,
        book['title'],
        book['author'],
        description,
        book['field'],
      ));
    });
    return searchResult;
  }
}
