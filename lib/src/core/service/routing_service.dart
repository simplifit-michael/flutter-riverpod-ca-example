import 'package:flutter/material.dart';
import 'package:ricknmorty/src/presentation/detail_view/detail_view.dart';
import 'package:ricknmorty/src/presentation/main_view/main_view.dart';

class RoutingService {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainView.path:
        return _regularRoute(const MainView());
      case DetailView.path:
        return _regularRoute(DetailView(routeSettings.arguments as int));
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute<void>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Route not found'),
        ),
        body: const Center(
          child: Text('Route not found'),
        ),
      ),
    );
  }

  static Route _regularRoute(Widget child) {
    return MaterialPageRoute<void>(builder: (_) => child);
  }
}
