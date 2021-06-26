import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class DealCard extends StatelessWidget {
  final bool isHorizontalScrolling;
  final Function onTap;

  const DealCard({this.onTap, this.isHorizontalScrolling = true});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomLeft,
        width: getProportionateScreenWidth(280),
        height: getProportionateScreenHeight(170),
        margin: EdgeInsets.only(
          left: isHorizontalScrolling
              ? getProportionateScreenWidth(16)
              : getProportionateScreenWidth(0),
          bottom: !isHorizontalScrolling
              ? getProportionateScreenHeight(32)
              : getProportionateScreenHeight(0),
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(
                8,
              ),
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              kGradientColor,
              kGradientColor.withOpacity(0),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            getProportionateScreenWidth(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fresh Fruit for You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Fresh fruit Everyday we Serve to You',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
