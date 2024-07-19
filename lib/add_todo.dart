// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  Function({required String todotext}) changeTextfun;
  AddTodo({super.key, required this.changeTextfun});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todotext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Add TODO :",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
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
            print(todotext.text);
            widget.changeTextfun(todotext: todotext.text);
            todotext.text = "";
          },
          child: Text(
            "Add",
            style: TextStyle(
                color: Colors.blue, fontSize: 26, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
