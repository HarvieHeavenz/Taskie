import 'package:flutter/material.dart';
import 'package:taskie/presentation/themes/palette.dart';

Widget buildGreeting(BuildContext context) {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Hello,',
            style: TextStyle(
              color: AppColors.offOrangeColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            greeting(),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    ),
  );
}
