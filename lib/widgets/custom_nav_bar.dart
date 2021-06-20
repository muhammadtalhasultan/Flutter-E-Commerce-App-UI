import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: kPrimaryGreen,
      unselectedItemColor: kGreyShade2,
      currentIndex: 0,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/home_nav.png',
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/star_nav.png',
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/cart_nav.png',
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/user_nav.png',
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
