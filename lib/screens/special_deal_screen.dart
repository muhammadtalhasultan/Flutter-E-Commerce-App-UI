import 'package:flutter/material.dart';
import 'package:s2_ecommerce/constants/colors.dart';
import 'package:s2_ecommerce/utils/screen_utils.dart';
import 'package:s2_ecommerce/widgets/custom_app_bar.dart';
import 'package:s2_ecommerce/widgets/deal_card.dart';

class SpecialDealScreen extends StatelessWidget {
  static const routeName = '/special_deal';

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              'Special Deals for You',
              [
                Icon(
                  Icons.search,
                  color: kPrimaryGreen,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(32),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16.0),
                ),
                children: [
                  DealCard(false),
                  DealCard(false),
                  DealCard(false),
                  DealCard(false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
