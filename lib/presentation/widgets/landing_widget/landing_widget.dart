import 'package:flutter/material.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/widgets/appbar.dart';
import 'package:taskie/presentation/widgets/greeting.dart';
import 'package:taskie/presentation/widgets/task_count_widget/task_count.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
              color: AppColors.primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBarWidget(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildGreeting(context),
                  TaskProgress(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
