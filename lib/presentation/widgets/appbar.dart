import 'package:flutter/material.dart';
import 'package:taskie/presentation/utils/constants/size_constants.dart';
import 'package:taskie/presentation/utils/screen_utils/screen_utils.dart';
import 'package:taskie/presentation/utils/extensions/size_extensions.dart';
import 'package:taskie/presentation/widgets/pop_up_menu/more_vert.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Center(
              child: Text(
                'Tas~kie',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          FilterButton(),
        ],
      ),
    );
  }
}
