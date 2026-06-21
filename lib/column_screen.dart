import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});

  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class  _ColumnScreenState extends State<ColumnScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Name", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           Text("Name: Sarthik, Class: MCA, Roll No: 1",
          style: TextStyle(fontSize: 20)),
           Text("Name: Riya, Class: BCA, Roll No: 2",
          style: TextStyle(fontSize: 20)),
           Text("Name: Bipasha, Class: MCA, Roll No: 3",
          style: TextStyle(fontSize: 20)),
           Text("Name: Ravinder, Class: B.voc, Roll No: 4",
          style: TextStyle(fontSize: 20)),
          Text("Name: Sahil, Class: MCA, Roll No: 5",
          style: TextStyle(fontSize: 20)),
          Text("Name: Nidhi, Class: BCA, Roll No: 6",
          style: TextStyle(fontSize: 20)),
          Text("Name: Shivani, Class: MCA, Roll No: 7",
          style: TextStyle(fontSize: 20)),
          Text("Name: Amrit, Class: MCA, Roll No: 8",
          style: TextStyle(fontSize: 20)),
          Text("Name: Kiran, Class: BCA, Roll No: 9",
          style: TextStyle(fontSize: 20)),
          Text("Name: kamal, Class: BCA, Roll No: 10",
          style: TextStyle(fontSize: 20)),
          Text("Name: Muskan, Class: BCA, Roll No: 11",
          style: TextStyle(fontSize: 20)),
          Text("Name: Preet, Class: BCA, Roll No: 12",
          style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
    );
 }
}