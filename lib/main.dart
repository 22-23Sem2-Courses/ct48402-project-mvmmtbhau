import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './ui/screen.dart';
import './model/plant_manager.dart';
import './model/cart_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PlantsManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: 'Gilroy',
        ),
        home: const SafeArea(
          child: SplashScreen(),
        ),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == DetailScreen.routeName) {
            final plantId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return DetailScreen(
                  ctx.read<PlantsManager>().findById(plantId),
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
