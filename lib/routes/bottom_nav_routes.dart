import 'package:flutter/material.dart';
import 'package:uts/screen/account_screen.dart';
import 'package:uts/screen/favorites_screen.dart';
import 'package:uts/screen/home_screen.dart';
import 'package:uts/screen/shopping_card_screen.dart';
import 'package:uts/widgets/custom_bottom_nav.dart';


class BottomNavRoutes extends StatefulWidget {
  const BottomNavRoutes({super.key});

  @override
  State<BottomNavRoutes> createState() => _BottomNavRoutesState();
}

class _BottomNavRoutesState extends State<BottomNavRoutes> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    AccountScreen(),
    FavoriteScreen(),
    ShoppingCartScreen(cartItems: [],),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
