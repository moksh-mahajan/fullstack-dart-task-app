import '../shared.dart';

abstract interface class TaskRepo {
  Future<List<Task>> fetchAllTasks();
  Future<Task> getTaskById(String id);
  Future<Task> addTask(Task task);
  Future<Task> updateTask(Task task);
  Future<Task> deleteTask(String id);
}
