import 'package:flutter/material.dart';
import 'home_screen_2.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'list_build.dart';

class CustomBotttomBar extends StatefulWidget {
  const CustomBotttomBar({super.key});

  @override
  State<CustomBotttomBar> createState() => _CustomBotttomBarState();
}

class _CustomBotttomBarState extends State<CustomBotttomBar> {
  int selectedIndex = 0;

  List screen = [HomeScreen2(), SearchScreen(), ProfileScreen(),ListBuild(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Bar"), backgroundColor: Colors.indigo),

      body: screen[selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedIndex == 0
                        ? Icon(Icons.home_filled, color: Colors.white)
                        : Icon(Icons.home),
                    SizedBox(height: 5),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: selectedIndex == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    print("check SelectedIndex value: $selectedIndex");
                  });
                },
              ),

              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   selectedIndex == 1
                    ? Icon(Icons.settings, color: Colors.white)
                    : Icon(Icons.settings),
            SizedBox(height: 5),
            Text(
                  "Settings",
                 style: TextStyle(
                  color: selectedIndex == 1 ? Colors.white : Colors.black,
             ),
          ),
        ],
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 1;

                    print("check SelectedIndex value: $selectedIndex");
                  });
                },
              ),

              GestureDetector(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     selectedIndex == 2
                ? Icon(Icons.account_circle, color: Colors.white)
                : Icon(Icons.account_circle),
             SizedBox(height: 5),
                Text(
                 "Profile",
                   style: TextStyle(
                     color: selectedIndex == 2 ? Colors.white : Colors.black,
             ),
            ),
          ],
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                    print("check SelectedIndex value: $selectedIndex");
                  });
                },
              ),
                GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list),
                    SizedBox(height: 5),
                    Text("List"),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                    print("check SelectedIndex value: $selectedIndex");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
         