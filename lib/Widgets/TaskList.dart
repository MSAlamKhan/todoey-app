// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Model/TaskData.dart';

import 'package:todoey/Widgets/TaskTile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              isChecked: task.isDone,
              checkBoxStateHandler: () {
                taskData.updateTask(task);
              },
              deleteTaskHandler: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
