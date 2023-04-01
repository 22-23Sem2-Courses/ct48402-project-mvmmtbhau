import 'package:flutter/foundation.dart';

import './cart_model.dart';
import './plant_manager.dart';

final plantManager = PlantsManager();
final plants = plantManager.plants;

class CartManager extends ChangeNotifier {
  final List<CartItem> _items = [
    CartItem(id: 'c1', plant: plants[0], quantity: 1),
    CartItem(id: 'c2', plant: plants[1], quantity: 3),
  ];

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
