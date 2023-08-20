import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/widgets/task_list_view.dart';
import 'core/bloc/bloc/task_bloc.dart';
import 'widgets/add_task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            onPressed: () => context.read<TaskBloc>().add(const LoadTasks()),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: TaskListView()),
          AddTaskWidget(),
        ],
      ),
    );
  }
}
