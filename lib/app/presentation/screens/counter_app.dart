import 'package:bloc_practice/app/constants/enums.dart';
import 'package:bloc_practice/app/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/app/logic/cubit/counter_state.dart';
import 'package:bloc_practice/app/logic/cubit/internet_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return const Text('WIFI');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return const Text('MOBILE');
                } else if (state is InternetDisconnected) {
                  return const Text('DISCONNECTED');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      backgroundColor: Colors.green,
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline2,
                    );
                  },
                );
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).increment(),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/counter_second');
              },
              child: const Text('Second page'),
            ),
          ],
        ),
      ),
    );
  }
}
