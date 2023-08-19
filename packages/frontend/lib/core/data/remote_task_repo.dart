import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:http/http.dart' as http;

class RemoteTaskRepo implements TaskRepo {
  final client = http.Client();
  final baseUrl = 'http://localhost:8080';

  @override
  Future<List<Task>> fetchAllTasks() async {
    final response = await client.get(Uri.parse('$baseUrl/tasks'));
    final json = response.body;

    final tasks = (jsonDecode(json) as List<dynamic>)
        .map((e) => Task.fromJson(e))
        .toList();
    return tasks;
  }

  @override
  Future<Task> getTaskById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/tasks/$id'));
    final json = response.body;

    final task = Task.fromJson(jsonDecode(json) as Map<String, dynamic>);
    return task;
  }

  @override
  Future<Task> addTask(Task task) async {
    final response = await client.post(Uri.parse('$baseUrl/tasks'),
        body: jsonEncode(task.toJson()));
    final json = response.body;

    return Task.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  @override
  Future<void> deleteTask(String id) async {
    await client.delete(Uri.parse('$baseUrl/tasks/$id'));
  }

  @override
  Future<void> updateTask(Task task) async {
    await client.put(Uri.parse('$baseUrl/tasks/${task.id}'),
        body: jsonEncode(
          task.toJson(),
        ));
  }
}
