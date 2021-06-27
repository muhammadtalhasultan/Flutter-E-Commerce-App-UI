import 'package:flutter/material.dart';
import '../screens/order_success_screen.dart';

import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/price_breakdown.dart';
import '../widgets/tab_title.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              'Checkout',
              [],
            ),
            Expanded(
              child: Column(
                children: [
                  TabTitle(
                    title: 'Destination',
                    actionText: 'Change',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DestinationCard(),
                        Divider(
                          height: getProportionateScreenHeight(48),
                        ),
                        Text(
                          'Choose payment method',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        PaymentCard(
                          isSelected: true,
                          title: '**** 2456',
                        ),
                        PaymentCard(title: 'Apple pay'),
                        PaymentCard(title: 'Cash on delivery'),
                        Divider(
                          height: getProportionateScreenHeight(56),
                        ),
                        PriceBreakdown(
                          title: 'Sub total Price',
                          price: '\$155',
                        ),
                        PriceBreakdown(
                          title: 'Delivery Fee',
                          price: '\$8',
                        ),
                        PriceBreakdown(
                          title: 'TanahAir Voucher',
                          price: 'None',
                        ),
                        PriceBreakdown(
                          title: 'Total price',
                          price: '\$163',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OrderSuccessScreen.routeName);
                },
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key key,
    this.isSelected = false,
    this.title,
  }) : super(key: key);

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(48),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(8.0),
      ),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(16.0),
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(
            8,
          ),
        ),
        boxShadow: [
          isSelected
              ? BoxShadow(
                  color: kShadowColor,
                  offset: Offset(
                    getProportionateScreenWidth(24),
                    getProportionateScreenWidth(40),
                  ),
                  blurRadius: 80,
                )
              : BoxShadow(color: Colors.transparent),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenWidth(40),
            decoration: ShapeDecoration(
              color: kGreyShade5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(8),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(17),
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(96),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getProportionateScreenWidth(
              80,
            ),
            width: getProportionateScreenWidth(
              80,
            ),
            decoration: ShapeDecoration(
              color: kGreyShade5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shoo Phar Nhoe',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(
                      17,
                    ),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Planet Namex, 989 Warhammer Street',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: kTextColorAccent,
                        ),
                    softWrap: true,
                  ),
                ),
                Text(
                  '(+78) 8989 8787',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: kTextColorAccent,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
