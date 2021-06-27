import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/discount_text.dart';

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
                if (isDiscount) DiscoutText(),
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
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Divider.png'),
                    ),
                  ),
                  child: Text(
                    '\$90',
                    style: TextStyle(
                      color: kTextColorAccent,
                    ),
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
