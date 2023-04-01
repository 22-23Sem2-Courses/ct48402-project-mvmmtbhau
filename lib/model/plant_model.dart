import 'package:flutter/foundation.dart';

class Plant {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final double price;
  final ValueNotifier<bool> _isFavorite;
  final bool isPopular;

  Plant({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.price,
    isFavorite = false,
    required this.isPopular,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Plant copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? category,
    String? description,
    double? price,
    bool? isFavorite,
    bool? isPopular,
  }) {
    return Plant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      isPopular: isPopular ?? this.isPopular,
    );
  }
}
