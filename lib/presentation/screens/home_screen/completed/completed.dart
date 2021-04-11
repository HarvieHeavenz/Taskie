import 'package:flutter/material.dart';
import 'package:taskie/data/database_helper/firestore/firestore_dao.dart';
import 'package:taskie/presentation/widgets/taskList/taskList.dart';

class Completed extends StatefulWidget {
  Completed({Key key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    Stream taskStream = FirestoreService().getTaskByStatus(
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
