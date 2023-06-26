import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites_page.dart';
import 'package:testing_app/screens/home_page.dart';

void main() {
  runApp(const TestingApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: FavoritesPage.routeName,
          builder: (context, state) {
            return const FavoritesPage();
          },
        ),
      ],
    ),
  ],
);

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
