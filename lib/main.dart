import 'package:flutter/material.dart';
import 'package:flutter_application_1/sqflitedb/student_list.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentList(),
    ),
  );
}