import 'package:flutter/material.dart';
import 'package:taskie/data/database_helper/firestore/firestore_dao.dart';
import 'package:taskie/data/models/task_model.dart';


class TaskProgress extends StatefulWidget {
  @override
  _TaskProgressState createState() => _TaskProgressState();
}

class _TaskProgressState extends State<TaskProgress> {
  @override
  Widget build(BuildContext context) {
    Stream taskStream = FirestoreService().getTaskByUser(
      '28452686-50c3-446e-aa9a-1ac3d355363c',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: StreamBuilder<Object>(
        stream: taskStream,
        builder: (context, snapshot) {
          List<TaskModel> taskList = snapshot.data;
          int completed = snapshot.hasData
              ? taskList.where((item) => item.isCompleted == true).length
              : 0;
          int total = taskList?.length ?? 0;

          if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
              style: TextStyle(color: Colors.redAccent),
            );
          }

          return Text(
            '$completed of $total',
            style: Theme.of(context).textTheme.headline5,
          );
        },
      ),
    );
  }
}
