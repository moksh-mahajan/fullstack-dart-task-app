import 'package:flutter/material.dart';
import 'package:frontend/widgets/task_list_view.dart';
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
      appBar: AppBar(title: const Text('Tasks')),
      body: const Column(
        children: [
          Expanded(child: TaskListView()),
          AddTaskWidget(),
        ],
      ),
    );
  }
}
