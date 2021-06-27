import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(112),
      width: getProportionateScreenWidth(112),
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: kGreyShade5,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(8),
              ),
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: kPrimaryGreen,
              ),
              child: Image.asset('assets/images/camera.png'),
            ),
          )
        ],
      ),
    );
  }
}
