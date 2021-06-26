import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class DiscoutText extends StatelessWidget {
  const DiscoutText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
