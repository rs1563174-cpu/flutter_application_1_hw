import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final name;
  final company;
  const SecondScreen({required this.name, required this.company, super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.name.toString()),
          Text(widget.company.toString()),
        ],
      ),
    );
  }
}