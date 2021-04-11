import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/data/models/task_model.dart';
import 'package:taskie/presentation/blocs/bloc/task_bloc.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/constants/size_constants.dart';
import 'package:taskie/presentation/utils/extensions/size_extensions.dart';
import 'package:taskie/presentation/utils/functions/function_helpers.dart';
import 'package:taskie/presentation/utils/routes/route_list.dart';

class TaskWrapper extends StatefulWidget {
  final TaskModel task;
  TaskWrapper({Key key, @required this.task}) : super(key: key);

  @override
  _TaskWrapperState createState() => _TaskWrapperState();
}

class _TaskWrapperState extends State<TaskWrapper> {
  @override
  Widget build(BuildContext context) {
    String taskId = widget.task.id;
    bool isCompleted = widget.task.isCompleted;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              Utils.formatTime(widget.task.time),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            height: Sizes.dimen_48.h,
            width: Sizes.dimen_340.w,
            decoration: BoxDecoration(
              color: AppColors.darkOffBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 0),
                      child: Text(
                        widget.task.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: Sizes.dimen_18.sp,
                          color: AppColors.offOrangeColor,
                          fontWeight: FontWeight.w800,
                          decoration: isCompleted == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Sizes.dimen_20,
                      width: Sizes.dimen_40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: AppColors.offOrangeColor,
                      ),
                      child: Text(
                        '${widget.task.priority}',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    Container(
                      child: CircularCheckBox(
                        activeColor: AppColors.offRedColor,
                        checkColor: AppColors.primaryColor2,
                        value: isCompleted,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        onChanged: (v) {
                          BlocProvider.of<TaskBloc>(context).add(
                            IsCompletedEvent(
                              taskId: taskId,
                              isCompleted: !isCompleted,
                            ),
                          );
                          setState(() {
                            isCompleted = !isCompleted;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.task.desc,
                    style: TextStyle(
                      fontSize: Sizes.dimen_14.sp,
                      color: Colors.white,
                      decoration: isCompleted == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(right: 40),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 14,
                              color: AppColors.primarySoft,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                RouteList.addTaskScreen,
                                arguments: widget.task,
                              );
                            },
                          ),
                        ),
                        Container(
                          child: Text(
                            '${widget.task.activity}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
