import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/service/routing_service.dart';
import 'package:ricknmorty/src/presentation/main_view/main_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        initialRoute: MainView.path,
        onGenerateRoute: RoutingService.getRoute,
      ),
    );
  }
}
