import 'package:bloc_practice/app/presentation/screens/counter_app.dart';
import 'package:bloc_practice/app/presentation/screens/counter_second_page.dart';
import 'package:bloc_practice/app/presentation/screens/home_page.dart';
import 'package:bloc_practice/app/presentation/screens/settings_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case '/counter':
        return MaterialPageRoute(
          builder: (_) => CounterApp(),
        );

      case '/counter_second':
        return MaterialPageRoute(
          builder: (_) => CounterSecondPage(),
        );

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
