// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/widgets/todolist.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String text1 = "Sample text";

  List<String> todolist = [];

  addtodo({required String todotext}) {
    if (todolist.contains(todotext)) {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("This task is already added to the list"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
      return;
    }
    setState(() {
      todolist.insert(0, todotext);
      Navigator.pop(context);
    });
    updateLocalData();
  }

  updateLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("todolist", todolist);
  }

  readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todolist = (prefs.getStringList("todolist") ?? []).toList();
    setState(() {
      todolist = todolist;
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

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
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 250,
                        child: AddTodo(
                          addtodo: addtodo,
                        ),
                      ),
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
        body: TodoListBulider(
          todolist: todolist,
          updateLocalData: updateLocalData,
        ));
  }
}
