import 'package:flutter/material.dart';
import 'package:s2_ecommerce/constants/colors.dart';
import 'package:s2_ecommerce/utils/screen_utils.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  const CustomIconButton(this.icon, this.onPress);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kGreyShade5,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenWidth(40),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(8.0),
        ),
      ),
      onPressed: onPress,
      child: Icon(
        icon,
        color: kGreyShade1,
      ),
    );
  }
}
