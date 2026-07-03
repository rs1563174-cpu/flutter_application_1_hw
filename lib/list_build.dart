import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListBuild extends StatefulWidget {
  const ListBuild({super.key});

  @override
  State<ListBuild> createState() => _ListBuildState();
}

class _ListBuildState extends State<ListBuild> {
  List<Student> nameList = [];
  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                print("CHeck INdex value: $index");
                setState(() {
                  customDialog(context, index);
                });
              },
              child: Card(
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                        Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      SizedBox(height: 5),
                      Text(nameList[index].id.toString()),
                       SizedBox(height: 5),
                      Text(nameList[index].name.toString()),
                       SizedBox(height: 5),
                      Text(nameList[index].className.toString()),
                       SizedBox(height: 5),
                      Text(nameList[index].rollNo.toString()),
                  ],
               ),
            IconButton(
            onPressed: () {
              setState(() {
              nameList.removeAt(index);
           });
          },
          icon: Icon(
           Icons.delete,
           color: Colors.red,
          ),
        ),
      ],
    ),
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
              customDialog(context, -1);
            },
            child: Icon(Icons.add),
          ),
        ),
        // ),
      ],
    );
  }

  void customDialog(context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (index != -1) {
          nameCOntroller.text = nameList[index].name.toString();
          idController.text = nameList[index].id.toString();
          classController.text = nameList[index].className.toString();
          rollNoController.text = nameList[index].rollNo.toString();
        }
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
                  controller: idController,
                  decoration: InputDecoration(
                    label: Text("Enter Your Id"),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10),
                TextField(
                  controller: nameCOntroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Your Name"),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: classController,
                  decoration: InputDecoration(
                    label: Text("Enter Your class Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: rollNoController,
                  decoration: InputDecoration(
                    label: Text("Enter Your ROll No"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (idController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter ID");
                      } else if (nameCOntroller.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Your Name");
                      } else if (classController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Class Name");
                      } else if (rollNoController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Roll No");
                      } else {
                        setState(() {
                          Student std = Student(
                            idController.text.toString(),
                            nameCOntroller.text.toString(),
                            classController.text.toString(),
                            rollNoController.text.toString(),
                          );

                          if (index == -1) {
                            nameList.add(std);
                          } else {
                            nameList[index].name = nameCOntroller.text;
                            nameList[index].id = idController.text;
                            nameList[index].rollNo = rollNoController.text;
                            nameList[index].className = classController.text;
                          }
                          nameCOntroller.clear();
                          idController.clear();
                          classController.clear();
                          rollNoController.clear();
                        });
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                      backgroundColor: Colors.orange,
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

class Student {
  String? id;
  String? name;
  String? className;
  String? rollNo;

  Student(this.id, this.name, this.className, this.rollNo);

  String? getId() {
    return id;
  }

  String? getName() {
    return name;
  }

  String? getClassName() {
    return className;
  }

  String? getRollNo() {
    return rollNo;
  }
}