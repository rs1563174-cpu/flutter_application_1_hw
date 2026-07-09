import 'package:flutter/material.dart';
import 'database_help.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  DatabaseHelp db = DatabaseHelp();
  List<StudentClass> nameList = [];
  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Call InitState auto");
    getStudentData();
  }

  Future<void> getStudentData() async {
    try {
      nameList = await db.getStudents();
      setState(() {});

      for (int i = 0; i < nameList.length; i++) {
        print("Get NameList name: ${nameList[i].name} , ${nameList[i].id}");
      }
    } catch (e) {
      print("Check Get Data Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite Database"),
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: nameList.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nameList[index].name.toString()),
                            Text(nameList[index].rollNo.toString()),
                            Text(nameList[index].className.toString()),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          customsDialog(context, index);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await db.deleteStudent(nameList[index].id!);

                          Fluttertoast.showToast(msg: "Student Deleted");
                           getStudentData();
                     },
                    icon: const Icon(Icons.delete),
                   ),

                      IconButton(onPressed: () {

                        
                      }, icon: Icon(Icons.delete)),
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
                customsDialog(context, -1);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void customsDialog(context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (index != -1) {
          print("Check ID or Riya: ${nameList[index].id.toString()}");
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
                  index == -1 ? "Add Student" : "Update Student",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      if (nameCOntroller.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Your Name");
                      } else if (classController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Class Name");
                      } else if (rollNoController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Roll No");
                      } else {
                        setState(() {
                          try {
                            if (index == -1) {
                              StudentClass std = StudentClass(
                                name: nameCOntroller.text.toString(),
                                className: classController.text.toString(),
                                rollNo: rollNoController.text.toString(),
                              );

                              db.insertStudent(std);
                            } else {
                              StudentClass std1 = StudentClass(
                                id: nameList[index].id,
                                name: nameCOntroller.text.toString(),
                                className: classController.text.toString(),
                                rollNo: rollNoController.text.toString(),
                              );
                              db.updateStudent(std1);
                            }

                            Navigator.pop(context);

                            getStudentData();
                          } catch (e) {
                            print("Check Exception: $e");
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

class StudentClass {
  int? id;
  String name;
  String className;
  String rollNo;

  StudentClass({
    this.id,
    required this.name,
    required this.className,
    required this.rollNo,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "className": className, "rollNo": rollNo};
  }

  factory StudentClass.fromMap(Map<String, dynamic> map) {
    return StudentClass(
      id: map["id"],
      name: map["name"],
      className: map["className"],
      rollNo: map["rollNo"],
    );
  }
}