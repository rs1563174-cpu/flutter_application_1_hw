import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text("Riya"), subtitle: Text("MCA")),
        ListTile(title: Text("Bipasha"), subtitle: Text("MCA")),
        ListTile(title: Text("Vanshika"), subtitle: Text("B.Tech")),
        ListTile(title: Text("Sahil"), subtitle: Text("MCA")),
        ListTile(title: Text("Sarthik"), subtitle: Text("MCA")),
        ListTile(title: Text("Gurbhej"), subtitle: Text("B.Tech")),
        ListTile(title: Text("Ritik"), subtitle: Text("MCA")),
        ListTile(title: Text("Sarina"), subtitle: Text("MCA")),
        ListTile(title: Text("Simran"), subtitle: Text("B.Tech")),
        ListTile(title: Text("Amrit"), subtitle: Text("MCA")),
        ListTile(title: Text("Shivani"), subtitle: Text("MCA")),
        ListTile(title: Text("Nidhi"), subtitle: Text("B.Tech")),
        ListTile(title: Text("Kiran"), subtitle: Text("MCA")),
        ListTile(title: Text("Jasmeen"), subtitle: Text("MCA")),
        ListTile(title: Text("kavita"), subtitle: Text("B.Tech")),
      ],
    );
  }
}