import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/bloc/task_bloc.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        final tasks = state.tasks;

        if (tasks.isEmpty) {
          return const Center(
            child: Text('No task to show!'),
          );
        }

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
      },
    );
  }
}
