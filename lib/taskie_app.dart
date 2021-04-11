import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/main.dart';
import 'package:taskie/presentation/blocs/filterBloc/bloc/filter_bloc.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/themes/text_theme.dart';
import 'package:taskie/presentation/utils/routes/route_list.dart';
import 'presentation/blocs/bloc/task_bloc.dart';
import 'presentation/utils/routes/fade_page_builder.dart';
import 'presentation/utils/routes/routes.dart';
import 'presentation/utils/screen_utils/screen_utils.dart';

class TaskieApp extends StatefulWidget {
  const TaskieApp({Key key}) : super(key: key);

  @override
  _TaskieAppState createState() => _TaskieAppState();
}

class _TaskieAppState extends State<TaskieApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor2,
        primaryColorBrightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: AppBarTheme(elevation: 0.0),
      ),
      builder: (context, child) {
        return child;
      },
      initialRoute: initScreen == 0 || initScreen == null
          ? RouteList.initial
          : RouteList.homeScreen,
      onGenerateRoute: (RouteSettings routeSettings) {
        final routes = Routes.getRoutes(routeSettings);
        final WidgetBuilder builder = routes[routeSettings.name];
        return FadePageRouteBuilder(
          builder: builder,
          routeSettings: routeSettings,
        );
      },
    );
  }
}
