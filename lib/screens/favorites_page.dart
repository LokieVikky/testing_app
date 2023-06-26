import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = 'favorites_page';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  key: Key('favorites_text_$index'),
                  'Item no $index',
                ),
                trailing: IconButton(
                  key: Key('remove_icon_$index'),
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Provider.of<Favorites>(context, listen: false).remove(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Removed from favorites.'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: value.favoriteItems.length,
          );
        },
      ),
    );
  }
}
