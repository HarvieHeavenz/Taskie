part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskLoadedEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  const AddTaskEvent({this.taskModel});

  @override
  List<Object> get props => [taskModel];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  final String taskId;
  const UpdateTaskEvent({this.taskId, this.taskModel});

  @override
  List<Object> get props => [taskId, taskModel];
}

class DeleteTaskEvent extends TaskEvent {
  final String taskId;
  const DeleteTaskEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class IsCompletedEvent extends TaskEvent {
  final bool isCompleted;
  final String taskId;

  const IsCompletedEvent({this.isCompleted, this.taskId});

  @override
  List<Object> get props => [isCompleted, taskId];
}
