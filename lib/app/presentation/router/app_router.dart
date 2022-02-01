import 'package:bloc_practice/app/presentation/screens/counter_app.dart';
import 'package:bloc_practice/app/presentation/screens/counter_second_page.dart';
import 'package:bloc_practice/app/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
        break;
      case '/counter':
        return MaterialPageRoute(
          builder: (_) => CounterApp(),
        );
        break;
      case '/counter_second':
        return MaterialPageRoute(
          builder: (_) => CounterSecondPage(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
