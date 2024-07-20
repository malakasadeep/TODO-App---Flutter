// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class TodoListBulider extends StatefulWidget {
  List<String> todolist;
  Function() updateLocalData;
  TodoListBulider(
      {super.key, required this.todolist, required this.updateLocalData});

  @override
  State<TodoListBulider> createState() => _TodoListBuliderState();
}

class _TodoListBuliderState extends State<TodoListBulider> {
  void onItemClicked({required int index}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.todolist.removeAt(index);
                  Navigator.pop(context);
                });
                widget.updateLocalData();
              },
              child: Text("Mark As Done"),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todolist.isEmpty)
        ? Center(
            child: Text("NO todo data available..."),
          )
        : ListView.builder(
            itemCount: widget.todolist.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.green[300],
                  child: Icon(Icons.check),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  setState(() {
                    widget.todolist.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                child: ListTile(
                  onTap: () {
                    onItemClicked(index: index);
                  },
                  title: Text(widget.todolist[index]),
                ),
              );
            });
  }
}
