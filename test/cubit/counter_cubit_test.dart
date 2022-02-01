import 'package:bloc_practice/app/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/app/logic/cubit/counter_state.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for the CounterCubit is (counterValue: 0)', () {
      expect(
        counterCubit.state,
        CounterState(counterValue: 0),
      );
    });

    blocTest(
      'increment',
      build: () => counterCubit,
      act: (cubit) => counterCubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'decrement',
      build: () => counterCubit,
      act: (cubit) => counterCubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
