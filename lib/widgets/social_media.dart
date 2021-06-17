import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    this.method,
  });

  final String method;

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            kAccentGreen,
          ),
          foregroundColor: MaterialStateProperty.all(
            kPrimaryGreen,
          ),
          elevation: MaterialStateProperty.all(
            0,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(4),
              ),
            ),
          ),
          alignment: Alignment.centerLeft,
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              getProportionateScreenHeight(56),
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              '$method with Facebook',
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              '$method with Google',
            ),
          ),
        ],
      ),
    );
  }
}
