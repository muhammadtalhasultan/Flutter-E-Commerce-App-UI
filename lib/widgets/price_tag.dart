import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(8.0),
        horizontal: getProportionateScreenWidth(16.0),
      ),
      decoration: ShapeDecoration(
        color: kAccentGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8.0),
          ),
        ),
      ),
      child: Text(
        '\$56',
        style: Theme.of(context).textTheme.headline3.copyWith(
              color: kPrimaryGreen,
            ),
      ),
    );
  }
}
