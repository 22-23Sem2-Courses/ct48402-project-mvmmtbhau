import 'package:flutter/material.dart';

import '../model/plant_model.dart';
import '../model/cart_manager.dart';

import './screen.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  final Plant plant;

  const DetailScreen(
    this.plant, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          CartIcon(data: CartManager().plantCount),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(plant.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: plant.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: '   (${plant.category} Plant)',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.lightGreen,
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                size: 15,
                                color: !plant.isFavorite
                                    ? Colors.white
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: plant.description,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                height: 1.4,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CartCounter(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.green,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const AddToCart()
                        ],
                      ),
                    ],
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

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.green),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Buy now'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            numOfItems.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            setState(() {
              numOfItems++;
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, required press}) {
    return SizedBox(
      height: 30,
      width: 40,
      child: OutlinedButton(
        onPressed: press,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          foregroundColor: MaterialStateProperty.all(Colors.green),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
