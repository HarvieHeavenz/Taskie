import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/data/models/task_model.dart';
import 'package:taskie/presentation/blocs/bloc/task_bloc.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/widgets/taskList/task_container.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key key,
    @required this.taskStream,
  }) : super(key: key);
  final Stream taskStream;
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  DismissDirection dismissDirection = DismissDirection.horizontal;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: widget.taskStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: TextStyle(color: AppColors.darkGrey),
            ),
          );
        } else if (snapshot.data == 0) {
          return Center(
            child: Text('You currently have no task',
                style: Theme.of(context).textTheme.headline2),
          );
        }
        List<TaskModel> taskList = snapshot.data;
        return ListView.builder(
          itemCount: taskList?.length ?? 0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TaskModel taskModel = taskList[index];
            return Dismissible(
              key: ObjectKey(taskModel.id),
              onDismissed: (direction) {
                dismissDirection = direction;
                BlocProvider.of<TaskBloc>(context).add(
                  DeleteTaskEvent(taskModel.id),
                );
              },
              child: TaskWrapper(task: taskModel),
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Deleting',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
