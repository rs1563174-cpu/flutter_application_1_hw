import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
               Fluttertoast.showToast(
               msg: "This is Alert Message!",
                toastLength: Toast.LENGTH_SHORT,
               );
              
              print("My name is :Coder Roots");
            },
            child: Text("Eleavted Button"),
          ),

          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
             ScaffoldMessenger.of(
              context,
             ).showSnackBar(SnackBar(content: Text("This is my SnackBar")));
          }, child: Text("Outlined Button")),

          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              showAltertDailog(context);
          }, child: Text("Text Button")),
        ],
      ),
    );
  }
}

void showAltertDailog(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("Title"),

        content: Text("This is my Altert Message"),
        actions:[
          TextButton(onPressed: () {}, child: Text("Accept")),
          TextButton(onPressed: () {}, child: Text("Cancel")),
        ],
      );
    },
  );
}
  