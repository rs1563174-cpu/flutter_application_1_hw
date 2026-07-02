import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ListBuild extends StatefulWidget {
  const ListBuild({super.key});

  @override
  State<ListBuild> createState() => _ListBuildState();
}

class _ListBuildState extends State<ListBuild> {
  List<String> nameList = ["Riya", "Bipasha", "Vanshika", "Amrit", "Shivani"];
  TextEditingController nameController =TextEditingController();
  int? editIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        ListView.builder(
      itemCount: nameList.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            print("Check Index value:$index");
             editIndex = index;
                nameController.text = nameList[index];
               customDialog(context);
          },
          child: Card(
             margin: EdgeInsets.all(5),
             child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(nameList[index]),
              trailing: IconButton(
               icon: const Icon(Icons.delete, color: Colors.red),
               onPressed: () {
                setState(() {
                  nameList.removeAt(index);
             });
          },
       ),
     ),
                  ],
                ),
              ),
            );
          },
        ),

        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              customDialog(context);
            },
            child: Icon(Icons.add),
          ),
        ),
        // ),
      ],
    );
  }

  void customDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Student",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Your Name"),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Student Name");
                      } else {
                       setState(() {
                        if (editIndex == null) {
                          nameList.add(nameController.text);
                        } else {
                           nameList[editIndex!] = nameController.text;
                           editIndex = null;
                        }
                     nameController.clear();
                     });
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Save Name"),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}