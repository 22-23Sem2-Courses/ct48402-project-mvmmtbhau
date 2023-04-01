import 'package:flutter/material.dart';
import 'package:myproject_app/model/cart_model.dart';

import '../model/cart_manager.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final cart = CartManager();

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final plants = cart.cartItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${cart.plantCount} items',
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cart.plantCount,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(UniqueKey().toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  plants.removeAt(index);
                });
              },
              child: CartItemCard(plant: plants[index]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CheckOutCard(),
    );
  }
}

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Colors.black38,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Total:\n',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: '\$${cart.totalAmount}',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.plant,
  });

  final CartItem plant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(plant.plant.imagePath),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plant.plant.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text: "\$${plant.plant.price}",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: " x${plant.quantity}",
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
