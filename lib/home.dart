import 'package:cart_app/create.dart';
import 'package:cart_app/delete.dart';
import 'package:cart_app/fetch.dart';
import 'package:cart_app/update.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Cart Simulator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Create()));
                },
                child: const Text("Create")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Fetchdata()));
                },
                child: const Text("Read")),
            ElevatedButton(onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Update()));}, child: const Text("Update")),
            ElevatedButton(onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const delete()));},  child: const Text("Delete")),
          ],
        ),
      ),
    );
  }
}
