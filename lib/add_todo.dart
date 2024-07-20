// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTodo extends StatefulWidget {
  Function({required String todotext}) addtodo;
  AddTodo({super.key, required this.addtodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todotext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Add TODO :",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            onSubmitted: (value) {
              if (todotext.text.isNotEmpty) {
                widget.addtodo(todotext: todotext.text);
              }

              todotext.text = "";
            },
            autofocus: true,
            controller: todotext,
            decoration: InputDecoration(
              hintText: "Enter Your TODO Task....",
            ),
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              if (todotext.text.isNotEmpty) {
                widget.addtodo(todotext: todotext.text);
              }

              todotext.text = "";
            },
            child: Text(
              "Add",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
