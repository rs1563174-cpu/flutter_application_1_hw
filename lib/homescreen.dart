
import 'package:flutter/material.dart';

class  HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Home Screen",
        style:TextStyle(
          color: Colors.white,
          fontWeight:  FontWeight.bold,
          fontSize:20,
        ), // TextStyle
       ), // Text
       backgroundColor: Colors.pink,
      ), // AppBar
      body: Center (child: Text ("Hello, Coder Roots")),
    );
  }
}


