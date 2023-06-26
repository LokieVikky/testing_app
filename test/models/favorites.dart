import 'package:test/test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    Favorites favorites = Favorites();

    test('A new item should be added', () {
      int number = 20;
      favorites.add(number);
      expect(favorites.favoriteItems.contains(number), true);
    });

    test('A item should be removed', () {
      int number = 40;
      favorites.add(number);
      expect(favorites.favoriteItems.contains(number), true);
      favorites.remove(number);
      expect(favorites.favoriteItems.contains(number), false);
    });
  });
}
