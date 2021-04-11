import 'package:flutter/cupertino.dart';
import 'package:taskie/presentation/screens/addTask_screen/addTask_screen.dart';
import 'package:taskie/presentation/screens/home_screen/home_screen.dart';
import 'package:taskie/presentation/screens/splash_screen/splash_screen.dart';
import 'package:taskie/presentation/utils/routes/route_list.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings routeSettings) => {
        RouteList.initial: (context) => SplashScreen(),
        RouteList.homeScreen: (context) => HomeScreen(),
        RouteList.addTaskScreen: (context) =>
            AddTaskScreen(taskModel: routeSettings.arguments),
      };
}
