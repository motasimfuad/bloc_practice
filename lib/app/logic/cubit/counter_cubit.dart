import 'dart:async';

import 'package:bloc_practice/app/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_practice/app/constants/enums.dart';
import 'package:bloc_practice/app/logic/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({
    required this.internetCubit,
  }) : super(CounterState(counterValue: 0)) {
    // internetStreamSubscription = internetCubit;
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
