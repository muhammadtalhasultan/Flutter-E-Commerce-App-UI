import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../widgets/order_card.dart';

import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_input_button.dart';
import '../widgets/small_quantity_input.dart';
import '../screens/checkout_screen.dart';
import '../widgets/price_breakdown.dart';

class OrderSummaryScreen extends StatelessWidget {
  static const routeName = '/orderSummary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      'Order Summary',
                      [],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16.0),
                        vertical: getProportionateScreenHeight(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderList(),
                          Divider(
                            height: getProportionateScreenHeight(32),
                          ),
                          Text(
                            'Promo Code',
                            style: TextStyle(
                              color: kTextColorAccent,
                              fontSize: getProportionateScreenWidth(17),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          PromoInput(),
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CheckoutScreen.routeName);
                },
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderList extends StatefulWidget {
  const OrderList({
    Key key,
  }) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  int totalItem = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        totalItem,
        (index) => Column(
          children: [
            OrderCard(
              key: UniqueKey(),
              isSelected: index == 0 ? true : false,
              onTapHandler: () {
                setState(() {
                  totalItem--;
                });
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoInput extends StatelessWidget {
  const PromoInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8.0),
          ),
          borderSide: BorderSide(color: kGreyShade3),
        ),
        hintText: 'Enter Promo Code',
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(17),
          color: kTextColorThird,
        ),
        suffixIcon: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Apply',
                style: TextStyle(
                  color: kPrimaryGreen,
                  fontSize: getProportionateScreenWidth(17),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
