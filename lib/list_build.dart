import 'package:flutter/material.dart';

class ListBuild extends StatefulWidget {
  const ListBuild({super.key});

  @override
  State<ListBuild> createState() => _ListBuildState();
}

class _ListBuildState extends State<ListBuild> {
  List<String> nameList = ["Amrit", "Bipasha", "Gurbhej", "Riya", "Shivani"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nameList.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(nameList[index]),
              ),
            ],
          ),
        );

        //  ListTile(
        //   title: Text(nameList[index]),
        //   subtitle: Text(index.toString()),
        // );
      },
    );
  }
}