import 'package:flutter/material.dart';
import '../screens/tab_screen.dart';
import '../screens/home_screen.dart';

import './signup_screen.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/option_button.dart';
import '../widgets/or_row.dart';
import '../widgets/social_media.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonLS(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Log In Continue!',
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SocialMediaLogin(
                    method: 'Login',
                  ),
                  Spacer(),
                  OrRow(),
                  Spacer(),
                  TextFields(),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kPrimaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(TabScreen.routeName);
                    },
                    child: Text('Login'),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  OptionButton(
                    desc: 'Don\'t have an account? ',
                    method: 'Sign Up',
                    onPressHandler: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class TextFields extends StatelessWidget {
  const TextFields({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: 'Email Address',
        ),
        SizedBox(
          height: getProportionateScreenHeight(16),
        ),
        CustomTextField(
          hint: 'Password',
          icon: Image.asset('assets/images/hide_icon.png'),
        ),
      ],
    );
  }
}
