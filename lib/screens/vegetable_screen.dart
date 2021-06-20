import 'package:flutter/material.dart';
import 'package:s2_ecommerce/constants/colors.dart';
import 'package:s2_ecommerce/utils/screen_utils.dart';

class VegetableScreen extends StatelessWidget {
  static const routeName = '/vegetable_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarVege(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  ListCard(
                    isSelected: true,
                    isDiscount: true,
                  ),
                  ListCard(
                    isSelected: false,
                    isDiscount: true,
                  ),
                  ListCard(
                    isSelected: false,
                    isDiscount: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final bool isSelected;
  final bool isDiscount;

  const ListCard({this.isDiscount, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(88),
      padding: EdgeInsets.all(
        getProportionateScreenWidth(8.0),
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8),
          ),
        ),
        color: isSelected ? Colors.white : Colors.transparent,
        shadows: [
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kGreyShade5,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isDiscount)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(4),
                    ),
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      color: kAlertColor,
                    ),
                    child: Text(
                      'Disc 40%',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (isDiscount) Spacer(),
                Text(
                  'Dragon Fruit',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Spacer(),
                Text(
                  '200gr',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: kTextColorAccent,
                  ),
                ),
                if (!isDiscount) Spacer(),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isDiscount)
                Text(
                  '\$90',
                  style: TextStyle(
                    color: kTextColorAccent,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              Text(
                '\$45',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAppBarVege extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: BackButtonText()),
        Text(
          'Featured Vegetables',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(17),
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.search,
                color: kPrimaryGreen,
              ),
              SizedBox(
                width: getProportionateScreenWidth(16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BackButtonText extends StatelessWidget {
  const BackButtonText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: kPrimaryGreen,
          ),
          Text(
            'Back',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: kPrimaryGreen,
                ),
          ),
        ],
      ),
    );
  }
}
