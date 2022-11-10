// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkBoxStateHandler, deleteTaskHandler;

  const TaskTile({
    required this.title,
    required this.isChecked,
    required this.checkBoxStateHandler,
    required this.deleteTaskHandler,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        deleteTaskHandler();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task Deleted'),
          ),
        );
      },
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (_) => checkBoxStateHandler(),
          activeColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
