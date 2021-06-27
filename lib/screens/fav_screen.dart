import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/item.dart';
import '../utils/screen_utils.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/list_card.dart';
import '../widgets/tab_title.dart';

class FavScreen extends StatelessWidget {
  final Function setstateCallback;

  const FavScreen(this.setstateCallback);

  @override
  Widget build(BuildContext context) {
    List<Widget> emptyCartWidgets = [
      Row(
        children: [
          Text(
            'My Favorite',
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
      Image.asset('assets/images/empty_cart_illu.png'),
      SizedBox(
        height: getProportionateScreenHeight(16.0),
      ),
      Text(
        'Oops your wishlish is empty',
        style: Theme.of(context).textTheme.headline3.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(16.0),
      ),
      Text(
        'It seems notinh in here. Explore more and shortlist some items',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4.copyWith(
              color: kTextColorAccent,
            ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(16.0),
      ),
      ElevatedButton(
        onPressed: setstateCallback,
        child: Text(
          'Start Shopping',
        ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(16.0),
      ),
      TabTitle(
        title: 'Recommendation for you',
        padding: 0,
      ),
      SizedBox(
        height: getProportionateScreenHeight(220),
        child: Row(
          children: [
            Expanded(
              child: IndiDealCard(
                noPadding: true,
                isSelected: true,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8),
            ),
            Expanded(
              child: IndiDealCard(
                noPadding: true,
                isSelected: false,
              ),
            ),
          ],
        ),
      ),
    ];

    List<Widget> cartWidgets = List.generate(
      Provider.of<Items>(context, listen: false).favoriteItems.length,
      (index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListCard(
            isDiscount: true,
            isSelected: false,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: getProportionateScreenHeight(40.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Remove'),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(16.0),
              ),
              Expanded(
                child: SizedBox(
                  height: getProportionateScreenHeight(40.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to Cart'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(16.0),
          ),
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: SingleChildScrollView(
        child: Column(
            children: Provider.of<Items>(context).favoriteItems.length == 0
                ? emptyCartWidgets
                : cartWidgets),
      ),
    );
  }
}
