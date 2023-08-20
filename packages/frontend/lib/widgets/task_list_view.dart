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
              title: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.title,
                  style: TextStyle(
                    decoration:
                        task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.read<TaskBloc>().add(
                          UpdateTaskStatus(
                              task: task.copyWith(
                                  isCompleted: !task.isCompleted))),
                      color: Colors.green,
                      icon: Icon(task.isCompleted
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                    ),
                    IconButton(
                      onPressed: () =>
                          context.read<TaskBloc>().add(DeleteTask(id: task.id)),
                      color: Colors.red,
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: tasks.length,
        );
      },
    );
  }
}
