import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class BackButtonLS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return RawMaterialButton(
      child: Icon(
        Icons.arrow_back_ios,
        color: kPrimaryGreen,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      constraints: BoxConstraints.tightFor(
        width: getProportionateScreenWidth(32),
        height: getProportionateScreenHeight(40),
      ),
    );
  }
}
