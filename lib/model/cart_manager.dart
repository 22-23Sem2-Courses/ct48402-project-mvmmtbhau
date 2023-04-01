import 'package:flutter/foundation.dart';

import './cart_model.dart';
import './plant_manager.dart';
import './plant_model.dart';

final plantManager = PlantsManager();
final plants = plantManager.plants;

class CartManager extends ChangeNotifier {
  List<CartItem> _items = [];

  void addItem(Plant plant) {
    if (_items.isEmpty) {
      _items.add(
        CartItem(plant: plant, quantity: 1),
      );
    } else {
      _items.add(
        CartItem(plant: plant, quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }

  int get plantCount {
    return _items.length;
  }

  List<CartItem> get cartItems {
    return _items.toList();
  }

  double get totalAmount {
    var total = 0.0;
    for (var i = 0; i < _items.length; i++) {
      total += _items[i].plant.price * _items[i].quantity;
    }
    return total;
  }
}
