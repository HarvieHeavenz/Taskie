import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/data/models/task_model.dart';
import 'package:taskie/presentation/blocs/bloc/task_bloc.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/constants/size_constants.dart';
import 'package:taskie/presentation/utils/functions/function_helpers.dart';
import 'package:taskie/presentation/utils/functions/validators.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  AddTaskScreen({Key key, @required this.taskModel}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  /// Text controllers
  TextEditingController _titleCtrl;
  TextEditingController _descCtrl;
  TextEditingController _dateCtrl;
  TextEditingController _timeCtrl;

  @override
  void initState() {
    super.initState();

    final TaskModel task = widget.taskModel;
    if (task != null) {
      priorityValue = task.priority;
      activityValue = task.activity;
    }
    _titleCtrl = TextEditingController(text: task == null ? '' : task.title);
    _descCtrl = TextEditingController(text: task == null ? '' : task.desc);
    _dateCtrl = TextEditingController(
      text: task == null ? '' : Utils.dateToString(task.date).substring(0, 10),
    );
    _timeCtrl = TextEditingController(
      text: task == null ? '' : Utils.formatTime(task.time),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleCtrl.dispose();
    _timeCtrl.dispose();
    _dateCtrl.dispose();
    _descCtrl.dispose();
  }

  final List<DropdownMenuItem<String>> _activityList = [
    '#Sport',
    '#Food',
    '#Music',
    '#Work',
    '#Idea',
    '#Financial'
  ].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList();

  final List<DropdownMenuItem<String>> _priorityList = [
    'High',
    'Mid',
    'Low',
  ].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList();

  var activityValue = '#Sport';
  var priorityValue = 'High';
  TaskBloc taskblocBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
              color: AppColors.primarySoft,
            ),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 70),
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is TaskInitial || state is TaskLoading) {
                    return Text(
                      widget.taskModel == null ? 'Create Task' : 'Update Task',
                      style: Theme.of(context).textTheme.headline5,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: Sizes.dimen_48,
                  height: Sizes.dimen_8,
                  decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _titleCtrl,
                              validator: (value) =>
                                  Validate.getMsg('title', value),
                              decoration: buildInputDecoration(
                                false,
                                'task title',
                                iconData: Icons.edit,
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              maxLines: 3,
                              maxLength: 100,
                              controller: _descCtrl,
                              validator: (value) =>
                                  Validate.getMsg('note', value),
                              decoration: buildInputDecoration(
                                true,
                                'brief description',
                              ),
                            ),
                            SizedBox(height: 10),
                            DropdownButtonFormField(
                              value: activityValue,
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: AppColors.offRedColor,
                                size: 30,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Activity',
                              ),
                              items: _activityList,
                              onChanged: (value) {
                                setState(
                                  () {
                                    activityValue = value;
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 15),
                            DropdownButtonFormField(
                              value: priorityValue,
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: AppColors.offRedColor,
                                size: 30,
                              ),
                              dropdownColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: 'Priority',
                              ),
                              items: _priorityList,
                              onChanged: (value) {
                                setState(
                                  () {
                                    priorityValue = value;
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        Utils.selectDate(context, _dateCtrl),
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _dateCtrl,
                                        validator: (value) => Validate.getMsg(
                                          'date',
                                          value,
                                        ),
                                        decoration: buildInputDecoration(
                                          false,
                                          'Date',
                                          iconData: Icons.calendar_today,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        Utils.selectTime(context, _timeCtrl),
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _timeCtrl,
                                        validator: (value) =>
                                            Validate.getDateTimeMsg(
                                          'time',
                                          value,
                                        ),
                                        decoration: buildInputDecoration(
                                          false,
                                          'Time',
                                          iconData: Icons.alarm,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            buildFlatButton(context, widget.taskModel)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildFlatButton(BuildContext context, TaskModel taskModel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: Sizes.dimen_200,
      height: Sizes.dimen_60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryColor,
      ),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            DateTime date = Utils.toDate(_dateCtrl.text);
            TimeOfDay time = Utils.toTime(_timeCtrl.text);

            TaskModel newTask = TaskModel(
              userId: '28452686-50c3-446e-aa9a-1ac3d355363c',
              title: _titleCtrl.text,
              desc: _descCtrl.text,
              priority: priorityValue,
              activity: activityValue,
              date: date,
              time: time,
              isCompleted: taskModel == null ? false : taskModel.isCompleted,
              createdAt:
                  taskModel == null ? DateTime.now() : taskModel.createdAt,
              updatedAt: DateTime.now(),
            );

            BlocProvider.of<TaskBloc>(context).add(
              taskModel == null
                  ? AddTaskEvent(taskModel: newTask)
                  : UpdateTaskEvent(taskModel: newTask, taskId: taskModel.id),
            );
          } else {
            setState(() => _autoValidate = true);
          }
        },
        child: BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is TaskSubmitted) {
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskInitial || state is TaskLoading) {
                return Text(
                  taskModel == null ? 'Create Task' : 'Update Task',
                  style: Theme.of(context).textTheme.button,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(bool isTextArea, String hintText,
          {IconData iconData}) =>
      InputDecoration(
        filled: true,
        hintText: hintText,
        fillColor: Colors.grey[300],
        prefixIcon: isTextArea ? null : Icon(iconData),
        contentPadding: isTextArea ? EdgeInsets.all(15.0) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      );
}
