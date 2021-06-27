import 'package:flutter/material.dart';

import '../screens/tab_screen.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class OrderSuccessScreen extends StatelessWidget {
  static const routeName = '/orderSuccess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset('assets/images/wallet_illu.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Order Successfully',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16.0),
                      ),
                      child: Text(
                        'Thank you for the order Your order will be prepared and shipped by courier within 1-2 days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: kTextColorAccent,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(TabScreen.routeName);
                },
                child: Text('Continue Shopping'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
