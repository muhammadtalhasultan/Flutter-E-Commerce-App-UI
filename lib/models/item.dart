import 'package:flutter/material.dart';

class Item with ChangeNotifier {
  final String name;
  final String mass;
  final String originalPrice;
  final String discountPrice;
  bool _isFavorite;

  Item({
    this.name,
    this.mass,
    this.originalPrice,
    this.discountPrice,
  });

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}

class Items with ChangeNotifier {
  final List<Item> _items = [
    Item(
      name: 'Dragon Fruit',
      mass: '200gr',
      originalPrice: '90',
      discountPrice: '45',
    ),
  ];

  final List<Item> _favoriteItems = [];

  void addToFavorite(Item item) {
    _favoriteItems.add(item);
  }

  List<Item> get favoriteItems {
    return [..._favoriteItems];
  }
}
