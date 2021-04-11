import 'package:flutter/material.dart';
import 'package:taskie/data/models/task_model.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/routes/route_list.dart';

class FloatingBtn extends StatelessWidget {
  final TaskModel taskModel;
  const FloatingBtn({Key key, this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.offOrangeColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 10),
            blurRadius: 8,
            spreadRadius: 4,
          )
        ],
      ),
      child: IconButton(
        color: AppColors.primaryColor2,
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteList.addTaskScreen);
        },
      ),
    );
  }
}
