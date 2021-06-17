import 'package:flutter/material.dart';
import 'package:s2_ecommerce/constants/colors.dart';
import 'package:s2_ecommerce/screens/landing_screen.dart';
import 'package:s2_ecommerce/utils/custom_theme.dart';
import 'package:s2_ecommerce/utils/screen_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        final customTheme = CustomTheme(constraints);
        return MaterialApp(
          title: 'Series 2 Ecommerce',
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: customTheme.nunito(),
            elevatedButtonTheme: customTheme.elevatedButtonTheme(),
            outlinedButtonTheme: customTheme.outlinedButtonTheme(),
          ),
          home: LandingScreen(),
        );
      },
    );
  }
}
