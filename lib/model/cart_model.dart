import './plant_model.dart';

class CartItem {
  final Plant plant;
  late int quantity;

  CartItem({
    required this.plant,
    required this.quantity,
  });
}
