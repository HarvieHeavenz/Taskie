import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskie/presentation/utils/functions/function_helpers.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial());

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    if (event is FilterUpdated) {
      yield* _mapUpdateFilterToState(event);
    }
  }

  Stream<FilterState> _mapUpdateFilterToState(FilterUpdated event) async* {
    yield FilteredTodosLoadSuccess(event.filter);
  }
}
