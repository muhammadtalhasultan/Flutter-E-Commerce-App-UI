import 'package:flutter/material.dart';
import 'package:s2_ecommerce/screens/my_profile_screen.dart';

import './screens/landing_screen.dart';
import './utils/custom_theme.dart';
import './screens/intro_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/add_address_screen.dart';
import './screens/map_screen.dart';
import './screens/search_screen.dart';
import './screens/vegetable_screen.dart';
import './screens/fruit_screen.dart';
import './screens/category_screen.dart';
import './screens/popular_deals_screen.dart';
import './screens/special_deal_screen.dart';
import './screens/special_deal_child_screen.dart';
import './screens/search_fruit_screen.dart';
import './screens/dragon_fruit_screen.dart';
import './screens/order_summary_screen.dart';
import './screens/checkout_screen.dart';
import './screens/order_success_screen.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final customTheme = CustomTheme(constraints);
        return MaterialApp(
          title: 'Series 2 Ecommerce',
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: customTheme.nunito(),
            elevatedButtonTheme: customTheme.elevatedButtonTheme(),
            outlinedButtonTheme: customTheme.outlinedButtonTheme(),
            textButtonTheme: customTheme.textButtonTheme(),
            dividerTheme: customTheme.dividerTheme(),
          ),
          home: LandingScreen(),
          routes: {
            IntroScreen.routeName: (ctx) => IntroScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignupScreen.routeName: (ctx) => SignupScreen(),
            AddAddressScreen.routeName: (ctx) => AddAddressScreen(),
            MapScreen.routeName: (ctx) => MapScreen(),
            TabScreen.routeName: (ctx) => TabScreen(),
            SearchScreen.routeName: (ctx) => SearchScreen(),
            VegetableScreen.routeName: (ctx) => VegetableScreen(),
            FruitScreen.routeName: (ctx) => FruitScreen(),
            CategoryScreen.routeName: (ctx) => CategoryScreen(),
            PopularDealsScreen.routeName: (ctx) => PopularDealsScreen(),
            SpecialDealScreen.routeName: (ctx) => SpecialDealScreen(),
            SpecialDealChildScreen.routeName: (ctx) => SpecialDealChildScreen(),
            SearchFruitScreen.routeName: (ctx) => SearchFruitScreen(),
            DragonFruitScreen.routeName: (ctx) => DragonFruitScreen(),
            OrderSummaryScreen.routeName: (ctx) => OrderSummaryScreen(),
            CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
            OrderSuccessScreen.routeName: (ctx) => OrderSuccessScreen(),
            MyProfileScreen.routeName: (ctx) => MyProfileScreen(),
          },
        );
      },
    );
  }
}
