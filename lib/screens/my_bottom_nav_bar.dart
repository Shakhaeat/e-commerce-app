import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/favourite_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/profile_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int currentIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const SearchScreen(),
    // const FavouriteScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',

              icon: Icon(
                Icons.home_rounded,
              ),
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              label: 'Search',

              icon: Icon(
                Icons.search,
              ),
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              label: 'Favourite',

              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              label: 'Profile',

              icon: Icon(
                Icons.person_2_outlined,
              ),
              // backgroundColor: Colors.green,
            ),
          ]),
    );
  }
}
