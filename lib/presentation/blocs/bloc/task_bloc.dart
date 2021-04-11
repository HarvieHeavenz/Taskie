import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskie/data/database_helper/firestore/firestore_dao.dart';
import 'package:taskie/data/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  FirestoreService firestoreService = FirestoreService();
  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is AddTaskEvent) {
      yield* _mapTaskAddedToState(event);
    } else if (event is UpdateTaskEvent) {
      yield* _mapTaskUpdatedToState(event);
    } else if (event is DeleteTaskEvent) {
      yield* _mapTaskDeletedToState(event);
    } else if (event is IsCompletedEvent) {
      yield* _mapCompleteTask(event);
    }
  }

  Stream<TaskState> _mapTaskAddedToState(AddTaskEvent event) async* {
    yield TaskLoading();
    await firestoreService.createTask(event.taskModel);
    yield TaskSubmitted();
  }

  Stream<TaskState> _mapTaskDeletedToState(DeleteTaskEvent event) async* {
    await firestoreService.deleteTask(event.taskId);
  }

  Stream<TaskState> _mapTaskUpdatedToState(UpdateTaskEvent event) async* {
    yield TaskLoading();
    await firestoreService.updateTask(event.taskId, event.taskModel);
    yield TaskSubmitted();
  }

  Stream<TaskState> _mapCompleteTask(IsCompletedEvent event) async* {
    yield TaskCompleting();
    await firestoreService.completeTask(event.taskId, event.isCompleted);
    yield TaskCompleted();
  }
}
