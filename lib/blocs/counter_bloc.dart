import 'package:comics/blocs/counter_events.dart';
import 'package:comics/blocs/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncreaseEvent>((event, emit) {
      emit(CounterIncrease(state.counter + 1));
    });
    on<CounterDecreaseEvent>((event, emit) {
      emit(CounterDecrease(state.counter - 1));
    });
  }
}
