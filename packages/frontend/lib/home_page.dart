import 'package:flutter/material.dart';
import 'package:frontend/widgets/task_list_view.dart';
import 'package:shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Column(
        children: [
          Expanded(
            child: TaskListView(
              tasks: [
                Task(id: '1', title: 'Task 1'),
                Task(id: '2', title: 'Task 2', isCompleted: true),
                Task(id: '3', title: 'Task 3'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      label: Text('New Task'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.check),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


