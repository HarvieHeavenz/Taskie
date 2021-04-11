import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TaskFilter {
  all,
  completed,
  pending,
}

class Utils {
  Utils();

  static DateTime timeToDateTime(
    TimeOfDay time, {
    year = 0,
    month = 0,
    day = 0,
  }) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  static String formatTime(TimeOfDay time) {
    return DateFormat.jm().format(timeToDateTime(time));
  }

  static String dateToString(DateTime date) => date.toString();

  static DateTime toDate(String date) => DateTime.parse(date);

  static String getHour(TimeOfDay time) {
    String hour = formatTime(time).split(":")[0];
    return (hour.length == 1) ? '0$hour' : hour;
  }

  static TimeOfDay toTime(String time) {
    String hour = time.split(':')[0];
    String rest = time.split(':')[1];
    String minute = rest.split(' ')[0];
    String period = rest.split(' ')[1];

    if (period == 'PM') {
      int parsedHour = int.parse(hour) + 12;
      hour = parsedHour.toString();
    }

    return TimeOfDay(
      hour: int.parse(hour),
      minute: int.parse(minute),
    );
  }

  static String getMinutes(TimeOfDay time) => formatTime(time).split(":")[1];

  static Future<Null> selectDate(
    BuildContext context,
    TextEditingController date,
  ) async {
    DateTime selectedDate = DateTime.now();

    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate = picked;
      date.value = TextEditingValue(
        text: dateToString(picked).substring(0, 10),
      );
    }

    return null;
  }

  static Future<String> selectTime(
    BuildContext context,
    TextEditingController time,
  ) async {
    TimeOfDay selectedTime = TimeOfDay.now();

    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child,
        );
      },
    );

    if (picked != null) {
      selectedTime = picked;
      time.value = TextEditingValue(
        text: formatTime(picked),
      );
    }

    return "";
  }

  static int randomNumber() {
    Random rng = new Random();
    return rng.nextInt(900000000) + 100000000;
  }
}
