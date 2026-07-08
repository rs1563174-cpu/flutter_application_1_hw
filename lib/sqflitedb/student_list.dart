import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
   List<Student> nameList = [];
  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite Database"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 2,
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
                            Text("Name"),
                            Text("Roll No"),
                            Text("Class"),
                          ],
                        ),
                      ),

                      Icon(Icons.edit),
                      Icon(Icons.delete),
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

              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
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
