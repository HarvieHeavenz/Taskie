import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskie/presentation/utils/functions/function_helpers.dart';

class TaskModel {
  final String id;

  final String userId;

  final String title;

  final String desc;

  final DateTime date;

  final TimeOfDay time;

  final String priority;

  final String activity;

  final bool isCompleted;

  final DateTime createdAt;

  final DateTime updatedAt;

  TaskModel({
    this.id,
    this.userId,
    this.title,
    this.desc,
    this.date,
    this.time,
    this.priority,
    this.activity,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  TaskModel.withId({
    this.id,
    this.userId,
    this.title,
    this.desc,
    this.date,
    this.time,
    this.priority,
    this.activity,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (userId != null) {
      map['userId'] = userId;
    }
    map['title'] = title;
    map['desc'] = desc;
    map['date'] = Utils.dateToString(date);
    map['priority'] = priority;
    map['activity'] = activity;
    map['time'] = Utils.formatTime(time);
    map['isCompleted'] = isCompleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  factory TaskModel.fromMap(DocumentSnapshot map) {
    return TaskModel.withId(
      id: map.id,
      userId: map['userId'],
      title: map['title'],
      desc: map['desc'],
      priority: map['priority'],
      isCompleted: map['isCompleted'],
      activity: map['activity'],
      date: DateTime.parse(map['date']),
      time: Utils.toTime(map['time']),
    );
  }
}
