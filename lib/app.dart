import 'package:craftster/shops/views/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const ShopScreen())],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Craftster', routerConfig: router);
  }
}
