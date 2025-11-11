import 'package:cosmetics_shop/pages/catalog_page.dart';
import 'package:cosmetics_shop/pages/main_page.dart';
import 'package:flutter/material.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key, required this.currentRouteIndex});

  final int currentRouteIndex;

  @override
  State<StatefulWidget> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  void _onItemTapped(int index) {
    final navigator = Navigator.of(context);
    switch (index) {
      case 0:
        navigator.pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
        break;
      case 1:
        navigator.pushReplacement(MaterialPageRoute(builder: (context) => CatalogPage()));
        break;
      default:
        navigator.pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
      currentIndex: widget.currentRouteIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Каталог'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Корзина'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Профиль'
        ),
      ],
      onTap: (index) => _onItemTapped(index),
    );
  }
}