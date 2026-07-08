import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('my_database.db');
    return _database!;
  }

  // var name = "coder";
  // var last = "Roots";

  // name +last

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      "CREATE TABLE users( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,  age INTEGER )",
    );
  }

  Future<int> insertUser(String name, int age) async {
    final db = await DatabaseHelper.instance.database;

    return await db.insert('users', {'name': name, 'age': age});
  }
}