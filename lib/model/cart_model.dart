import './plant_model.dart';

class CartItem {
  final String id;
  final Plant plant;
  final int quantity;

  CartItem({
    required this.id,
    required this.plant,
    required this.quantity,
  });
}
