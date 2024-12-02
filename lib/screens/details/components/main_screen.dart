import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';  // Import the package

import '../../home/dresses_screen.dart';
import '../../home/foot_wear_screen.dart';
import '../../home/home_screen.dart';
import '../../home/jewellery_screen.dart';

// Main Screen with Convex Navigation Bar
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens to navigate to
  final List<Widget> _screens = [
    HomeScreen(),
    JewelleryScreen(),
    FootWearScreen(),
    DressesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: Colors.transparent,
        items: [
          TabItem(icon: Image.asset("assets/icons/hand_bag(3).png"), title: 'Handbags'),
          TabItem(icon: Image.asset("assets/icons/jewellery_icon.png"), title: 'Jewellery'),
          TabItem(icon: Image.asset("assets/icons/footwear_icon.png"), title: 'Footwear'),
          TabItem(icon: Image.asset("assets/icons/50245.jpg"), title: 'Dresses'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
