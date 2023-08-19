import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasks[index];

        return ListTile(
          title: Text(task.title),
          trailing: task.isCompleted ? const Icon(Icons.check) : null,
        );
      },
      itemCount: tasks.length,
    );
  }
}