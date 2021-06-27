import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kGreyShade5,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(16.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kGreyShade1,
                  radius: getProportionateScreenWidth(4),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(8.0),
                ),
                CircleAvatar(
                  backgroundColor: kGreyShade3,
                  radius: getProportionateScreenWidth(4),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(8.0),
                ),
                CircleAvatar(
                  backgroundColor: kGreyShade3,
                  radius: getProportionateScreenWidth(4),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(8.0),
                ),
                CircleAvatar(
                  backgroundColor: kGreyShade3,
                  radius: getProportionateScreenWidth(4),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
