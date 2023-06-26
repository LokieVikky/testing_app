import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites_page.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Favorites favoritesList = Provider.of<Favorites>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Sample'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.go('/${FavoritesPage.routeName}');
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              key: Key('text_$index'),
              'Item no $index',
            ),
            trailing: IconButton(
              key: Key('icon_$index'),
              icon: favoritesList.favoriteItems.contains(index)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                !favoritesList.favoriteItems.contains(index) ? favoritesList.add(index) : favoritesList.remove(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(favoritesList.favoriteItems.contains(index)
                        ? 'Added to favorites.'
                        : 'Removed from favorites.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
