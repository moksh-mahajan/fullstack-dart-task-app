import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/widgets/task_list_view.dart';

import 'core/bloc/bloc/task_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _taskTitleController = TextEditingController();

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
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

                return TaskListView(tasks: tasks);
              },
            ),
          ),
          Padding(
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
                  onPressed: () =>
                      context.read<TaskBloc>().add(const LoadTasks()),
                  child: const Icon(Icons.refresh),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
