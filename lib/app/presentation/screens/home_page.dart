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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
