import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/order_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16.0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'My Cart',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: kPrimaryGreen,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(16.0),
            ),
            Column(
              children: List.generate(
                3,
                (index) => Column(
                  children: [
                    index == 0
                        ? OrderCard(
                            isSelected: true,
                          )
                        : OrderCard(),
                    SizedBox(
                      height: getProportionateScreenHeight(8.0),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total (5)',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '\$156',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size.fromHeight(
                          getProportionateScreenHeight(48),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Buy Now'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(24.0),
            ),
          ],
        ),
      ),
    );
  }
}
