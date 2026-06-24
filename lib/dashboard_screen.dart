import 'package:flutter/material.dart';
import 'home_screen_2.dart';
import 'search_screen.dart';
import 'profile_screen.dart';


class DashbroardScrren extends StatefulWidget {
  const DashbroardScrren({super.key});

  @override
  State<DashbroardScrren> createState() => _DashbroardScrrenState();
}

class _DashbroardScrrenState extends State<DashbroardScrren> {
    int selectedIndex = 0;

    void selectedValue (int index){
      setState((){
        selectedIndex = index;
    });
    print("Selectedindex value: $selectedIndex");
    }
    List screen = [HomeScreen2(), SearchScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Home Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap:((value)=> {selectedValue(value)}),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:"Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box),label:"Profile"), 
        ],
      ),
    );
   }
}