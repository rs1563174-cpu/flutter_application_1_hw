import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'student_list.dart';

class DatabaseHelp {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabasse();
    return _database;
  }

  Future<Database?> initDatabasse() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "student.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE student(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, rollNo TEXT, className TEXT)",
        );
      },
    );
  }

  Future insertStudent(StudentClass student) async {
    final db = await database;
    return await db?.insert("student", student.toMap());
  }

  Future<List<StudentClass>> getStudents() async {
    final db = await database;

    List<Map<String, dynamic>> maps = await db!.query("student");
    return List.generate(
      maps.length,
      (index) => StudentClass.fromMap(maps[index]),
    );
  }

  Future updateStudent(StudentClass student) async {
    final db = await database;
    return await db?.update(
      "student",
      student.toMap(),
      where: "id = ?",
      whereArgs: [student.id],
    );
  }

  Future deleteStudent(int id) async {
    final db = await database;
    return await db?.delete(
      "student",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}