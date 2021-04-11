part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterUpdated extends FilterEvent {
  final TaskFilter filter;

  const FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];
}
