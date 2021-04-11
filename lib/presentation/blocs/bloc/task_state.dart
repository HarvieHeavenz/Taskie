part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final List<TaskModel> task;
  const TaskLoaded({this.task});

  @override
  List<Object> get props => [task];
}

class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskNotLoaded extends TaskState {}

class TaskError extends TaskState {
  final String message;
  const TaskError({this.message});

  @override
  List<Object> get props => [message];
}

class IsSetReminder extends TaskState {
  final bool isSet;
  const IsSetReminder(this.isSet);
  @override
  List<Object> get props => [isSet];
}

class TaskCompleted extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskSubmitted extends TaskState {}

class TaskDeleting extends TaskState {}

class TaskCompleting extends TaskState {}
