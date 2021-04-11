part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class FilteredTodosLoadInProgress extends FilterState {}

class FilteredTodosLoadSuccess extends FilterState {
  final TaskFilter activeFilter;

  const FilteredTodosLoadSuccess(
    this.activeFilter,
  );

  @override
  List<Object> get props => [activeFilter];
}
