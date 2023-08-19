import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required this.taskRepo}) : super(const TaskState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
  }

  final TaskRepo taskRepo;

  Future<void> _onLoadTasks(
    LoadTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final tasks = await taskRepo.fetchAllTasks();
    emit(state.copyWith(isLoading: false, tasks: tasks));
  }

  Future<void> _onAddTask(
    AddTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final newTask = await taskRepo.addTask(Task(id: '', title: event.title));
    emit(state.copyWith(isLoading: false, tasks: [...state.tasks, newTask]));
  }
}

final class TaskState extends Equatable {
  final List<Task> tasks;
  final bool isLoading;

  const TaskState({
    this.tasks = const [],
    this.isLoading = false,
  });

  TaskState copyWith({List<Task>? tasks, bool? isLoading}) => TaskState(
      tasks: tasks ?? this.tasks, isLoading: isLoading ?? this.isLoading);

  @override
  List<Object?> get props => [tasks, isLoading];
}

@immutable
sealed class TaskEvent {
  const TaskEvent();
}

final class LoadTasks extends TaskEvent {
  const LoadTasks();
}

final class AddTask extends TaskEvent {
  const AddTask({required this.title});
  final String title;
}
