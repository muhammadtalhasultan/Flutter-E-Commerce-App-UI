import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomNavBar extends StatefulWidget {
  final Function(int) onTap;
  CustomNavBar(this.onTap);
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int curTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (tabIndex) {
        setState(() {
          curTabIndex = tabIndex;
        });
        widget.onTap(tabIndex);
      },
      selectedItemColor: kPrimaryGreen,
      unselectedItemColor: kGreyShade2,
      currentIndex: curTabIndex,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: curTabIndex == 0
              ? Image.asset(
                  'assets/images/home_nav.png',
                )
              : Image.asset(
                  'assets/images/home_nav_notfill.png',
                ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: curTabIndex == 1
              ? Image.asset(
                  'assets/images/star_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/star_nav.png',
                ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: curTabIndex == 2
              ? Image.asset(
                  'assets/images/cart_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/cart_nav.png',
                ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: curTabIndex == 3
              ? Image.asset(
                  'assets/images/profile_nav_fill.png',
                )
              : Image.asset(
                  'assets/images/user_nav.png',
                ),
          label: 'Profile',
        ),
      ],
    );
  }
}
