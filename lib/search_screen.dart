import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _clazzController = TextEditingController();

  String? name;
  String? clazz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Enter your Name"),
                label: Text("Enter Your Name"),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _clazzController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Enter your Class"),
                label: Text("Enter Your Class"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Your Name");
                  } else if (_clazzController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Your Class");
                  } else {
                    print(_nameController.text);
                    setState(() {
                      name = _nameController.text;
                      clazz = _clazzController.text;
                    });
                  }
                },

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),

                child: Text("Show Name"),
              ),
            ),
          ),

          SizedBox(height: 10),
          Text("Your Name is: $name and class is: $clazz"),
        ],
      ),
    );
  }
}
