import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/presentation/blocs/filterBloc/bloc/filter_bloc.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/functions/function_helpers.dart';

class FilterButton extends StatelessWidget {
  final bool visible;

  FilterButton({this.visible, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      return _Button(
        onSelected: (filter) {
          BlocProvider.of<FilterBloc>(context).add(FilterUpdated(filter));
        },
        activeFilter: state is FilteredTodosLoadSuccess
            ? state.activeFilter
            : TaskFilter.all,
        activeStyle: TextStyle(color: AppColors.offOrangeColor),
        defaultStyle: TextStyle(color: AppColors.darkGrey),
      );
    });
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<TaskFilter> onSelected;
  final TaskFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TaskFilter>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<TaskFilter>>[
        PopupMenuItem<TaskFilter>(
          value: TaskFilter.all,
          child: Text(
            'All',
            style: activeFilter == TaskFilter.all
                ? TextStyle(color: AppColors.offOrangeColor)
                : TextStyle(color: AppColors.darkGrey),
          ),
        ),
        PopupMenuItem<TaskFilter>(
          value: TaskFilter.pending,
          child: Text(
            'Pending',
            style: activeFilter == TaskFilter.pending
                ? TextStyle(color: AppColors.offOrangeColor)
                : TextStyle(color: AppColors.darkGrey),
          ),
        ),
        PopupMenuItem<TaskFilter>(
          value: TaskFilter.completed,
          child: Text(
            'Completed',
            style: activeFilter == TaskFilter.completed
                ? TextStyle(color: AppColors.offOrangeColor)
                : TextStyle(color: AppColors.darkGrey),
          ),
        ),
      ],
      icon: Icon(Icons.more_vert, color: AppColors.primaryColor2),
    );
  }
}
