import 'package:flutter/material.dart';
import 'package:rocketsoon/src/ui/view/favorites.dart';
import 'package:rocketsoon/src/ui/view/home.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rockets'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.rocket),
              onPressed: () {
                setState(() {
                  _pageController.jumpToPage(0);
                });
              },
            ),
            SizedBox(
              width: 80.0,
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                setState(() {
                  _pageController.jumpToPage(1);
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          FavoritesPage(),
        ],
      ),
    );
  }
}
