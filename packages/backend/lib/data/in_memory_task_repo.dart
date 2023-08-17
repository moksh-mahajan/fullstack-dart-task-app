import 'package:shared/shared.dart';

class InMemoryTaskRepo implements TaskRepo {
  var _data = <Task>[];

  @override
  Future<Task> addTask(Task task) async {
    final newTask = task.copyWith(id: '${_data.length}');
    _data.add(newTask);
    return newTask;
  }

  @override
  Future<void> deleteTask(String id) async {
    _data.removeWhere((element) => element.id == id);
  }

  @override
  Future<List<Task>> fetchAllTasks() async {
    return _data;
  }

  @override
  Future<Task> getTaskById(String id) async {
    return _data.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> updateTask(Task task) async {
    _data = _data.map((e) => e.id == task.id ? task : e).toList();

  }
}
