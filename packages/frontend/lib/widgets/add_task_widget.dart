import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/bloc/task_bloc.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _taskTitleController = TextEditingController();

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _taskTitleController,
              decoration: const InputDecoration(
                isDense: true,
                label: Text('New Task'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              context
                  .read<TaskBloc>()
                  .add(AddTask(title: _taskTitleController.text.trim()));
              _taskTitleController.clear();
            },
            child: const Icon(Icons.check),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => context.read<TaskBloc>().add(const LoadTasks()),
            child: const Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
