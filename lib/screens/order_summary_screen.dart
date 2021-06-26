import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key key,
    this.isSelected = false,
    this.onTapHandler,
  }) : super(key: key);

  final bool isSelected;
  final Function() onTapHandler;

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  final textController = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        height: getProportionateScreenHeight(88),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8.0),
            ),
          ),
          color: widget.isSelected ? Colors.white : Colors.transparent,
          shadows: widget.isSelected
              ? [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(
                      getProportionateScreenWidth(24),
                      getProportionateScreenWidth(40),
                    ),
                    blurRadius: 80,
                  )
                ]
              : [],
        ),
        padding: EdgeInsets.all(
          getProportionateScreenWidth(4.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: getProportionateScreenWidth(80),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dragon Fruit',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    '200gr',
                    style: TextStyle(
                      color: kTextColorAccent,
                      fontSize: getProportionateScreenWidth(
                        12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$45',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      CustomIconButton(
                        Icons.remove,
                        () {
                          setState(() {
                            int quantity = int.parse(textController.text);
                            quantity--;
                            textController.text = quantity.toString();
                          });
                        },
                        size: 32,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(4),
                      ),
                      SmallQuantityInput(
                        textController: textController,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(4),
                      ),
                      CustomIconButton(
                        Icons.add,
                        () {
                          setState(() {
                            int quantity = int.parse(textController.text);
                            quantity++;
                            textController.text = quantity.toString();
                          });
                        },
                        size: 32,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      actionExtentRatio: 0.25,
      secondaryActions: [
        SlideAction(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8.0),
            ),
            color: kAlertColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Trash Bin.png'),
              Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          onTap: widget.onTapHandler,
        )
      ],
    );
  }
}
