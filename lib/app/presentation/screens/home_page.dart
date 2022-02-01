import 'package:bloc_practice/app/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/app/logic/cubit/counter_state.dart';
import 'package:bloc_practice/app/logic/cubit/internet_cubit.dart';
import 'package:bloc_practice/app/presentation/screens/counter_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoc Practice'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/counter');
              },
              child: const Text('Counter App'),
            ),
          ],
        ),
      ),
    );
  }
}
