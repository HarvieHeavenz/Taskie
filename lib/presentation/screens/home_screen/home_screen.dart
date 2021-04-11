import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/presentation/blocs/bloc/task_bloc.dart';
import 'package:taskie/presentation/blocs/filterBloc/bloc/filter_bloc.dart';
import 'package:taskie/presentation/screens/home_screen/allTask/all_task.dart';
import 'package:taskie/presentation/screens/home_screen/completed/completed.dart';
import 'package:taskie/presentation/screens/home_screen/ongoing/pending.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/functions/function_helpers.dart';
import 'package:taskie/presentation/widgets/floatingbtn/floating_btn.dart';
import 'package:taskie/presentation/widgets/landing_widget/landing_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskBloc taskBloc;
  FilterBloc filterBloc;

  @override
  void initState() {
    super.initState();
    taskBloc = TaskBloc();
    filterBloc = FilterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(create: (context) => taskBloc),
        BlocProvider<FilterBloc>(create: (context) => filterBloc),
      ],
      child: Scaffold(
        floatingActionButton: FloatingBtn(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.3,
                child: LandingWidget()),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.7,
              child: Container(
                child: BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, state) {
                    if (state is FilterInitial) {
                      return AllTask();
                    } else if (state is FilteredTodosLoadSuccess) {
                      if (TaskFilter.all == state.activeFilter) {
                        return AllTask();
                      } else if (TaskFilter.completed == state.activeFilter) {
                        return Completed();
                      } else if (TaskFilter.pending == state.activeFilter) {
                        return Pending();
                      }
                    } else if (state is FilteredTodosLoadInProgress) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Center(
                      child: Text(
                        'Ooops Something went wrong',
                        style: TextStyle(
                          color: AppColors.darkGrey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
