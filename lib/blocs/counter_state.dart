class CounterState {
  CounterState(this.counter);
  final int counter;
}

class CounterIncrease extends CounterState {
  CounterIncrease(super.counter);
}

class CounterDecrease extends CounterState {
  CounterDecrease(super.counter);
}
