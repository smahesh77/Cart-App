import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCart"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Create")),
          ElevatedButton(onPressed: () {}, child: Text("Read")),
          ElevatedButton(onPressed: () {}, child: Text("Edit")),
          ElevatedButton(onPressed: () {}, child: Text("Delete")),
        ],
      ),
    );
  }
}
