import 'package:flutter/material.dart';

class RowScreen extends StatefulWidget {
  const RowScreen({super.key});

  @override
  State<RowScreen> createState() => _RowScreenState();
}

class _RowScreenState extends State<RowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row List"), backgroundColor: Colors.blue),
        body: SizedBox(
          width:double.infinity,
          height:double.infinity,
          child: Row(
           mainAxisAlignment: MainAxisAlignment.start, // vertical
           crossAxisAlignment: CrossAxisAlignment.start, //horizontal
           children: [
            Text("Riya"),
            SizedBox(width: 5),
            Text("Bipasha"),
            SizedBox(width: 5),
            Text("Vanishika"),
            SizedBox(width: 5),
            Text("Riya"),
            SizedBox(width: 5),
            Text("Bipasha"),
            SizedBox(width: 5),
           ],
          ),
        ),
   );    
  }
}