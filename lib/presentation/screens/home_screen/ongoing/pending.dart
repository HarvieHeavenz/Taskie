import 'package:flutter/material.dart';
import 'package:taskie/data/database_helper/firestore/firestore_dao.dart';
import 'package:taskie/presentation/widgets/taskList/taskList.dart';

class Pending extends StatefulWidget {
  Pending({Key key}) : super(key: key);

  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    Stream taskStream = FirestoreService().getTaskByStatus(
        '28452686-50c3-446e-aa9a-1ac3d355363c',
        isCompleted: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TaskList(
        taskStream: taskStream,
      ),
    );
  }
}
