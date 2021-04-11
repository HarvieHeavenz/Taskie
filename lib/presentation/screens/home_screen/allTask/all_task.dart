import 'package:flutter/material.dart';
import 'package:taskie/data/database_helper/firestore/firestore_dao.dart';
import 'package:taskie/presentation/widgets/taskList/taskList.dart';

class AllTask extends StatefulWidget {
  AllTask({Key key}) : super(key: key);

  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    Stream taskStream = FirestoreService().getTaskByUser(
      '28452686-50c3-446e-aa9a-1ac3d355363c',
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TaskList(
        taskStream: taskStream,
      ),
    );
  }
}
