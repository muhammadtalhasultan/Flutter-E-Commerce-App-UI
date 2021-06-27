import 'package:flutter/material.dart';
import 'package:s2_ecommerce/screens/home_screen.dart';
import 'package:s2_ecommerce/screens/user_screen.dart';
import 'package:s2_ecommerce/widgets/custom_nav_bar.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabScreen';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int curTab = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> pages = [
      {
        'widget': HomeScreen(),
      },
      {
        'widget': HomeScreen(),
      },
      {
        'widget': HomeScreen(),
      },
      {
        'widget': UserScreen(),
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: pages[curTab]['widget'],
      ),
      bottomNavigationBar: CustomNavBar((index) {
        setState(() {
          curTab = index;
        });
      }),
    );
  }
}
