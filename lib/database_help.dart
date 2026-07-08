import 'dart:core';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelp {

  //object of own class
  static final DatabaseHelp instance = DatabaseHelp._init();


// declare Database
  static Database? _database;


// initialization of _init function
  DatabaseHelp._init();


// create the  file of database
  Future<Database?> get database async {
    // if (_database != null) return _database;
    _database = await _initDB("my_database.db");
    return _database;
  }

// create the path of database file
  Future<Database> _initDB(String filepath) async {
    final path = await getDatabasesPath();
    final getPath = join(path, filepath);
    return await openDatabase(getPath, version: 1, onCreate: onCreateFun);
  }

// create the table to insert the data
  Future onCreateFun(Database db, version) async {
    return await db.execute(
      "Create Table student(id INTEGER PRIMARY KEY AUTOINCREMENT), name TEXT, rollNo Text, className Text",
    );
  }

  //Future<Database> insertData() {}
}