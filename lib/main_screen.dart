// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/add_todo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO App"),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    height: 250,
                    child: AddTodo(),
                  );
                },
              );
            },
            splashColor: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
