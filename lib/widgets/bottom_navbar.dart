import 'package:flutter/material.dart';

import '../ui/screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  PageController pageController = PageController();
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: child.length,
        controller: pageController,
        onPageChanged: (value) => setState(() => selectIndex = value),
        itemBuilder: (item, index) {
          return Container(child: child[selectIndex]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: SizedBox(
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    pageController.jumpToPage(0);
                  },
                );
              },
              child: Icon(
                Icons.house,
                color: selectIndex == 0 ? Colors.green : Colors.grey,
                size: selectIndex == 0 ? 35 : 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageController.jumpToPage(1);
                });
              },
              child: Icon(
                Icons.favorite,
                color: selectIndex == 1 ? Colors.green : Colors.grey,
                size: selectIndex == 1 ? 35 : 30,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

List<Widget> child = [
  const HomeScreen(),
  const FavoriteScreen(),
];
