import 'package:flutter/material.dart';
import '../screens/add_address_screen.dart';
import '../screens/login_screen.dart';

import '../utils/screen_utils.dart';
import '../widgets/back_button_ls.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/option_button.dart';
import '../widgets/or_row.dart';
import '../widgets/social_media.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signupScreen';
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
                          'Sign Up Continue!',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SocialMediaLogin(
                      method: 'Sign Up',
                    ),
                    Spacer(),
                    OrRow(),
                    Spacer(),
                    CustomTextField(
                      hint: 'Your Name',
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            hint: '+62',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                            hint: 'Phone Number',
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomTextField(hint: 'Email Address'),
                    Spacer(),
                    CustomTextField(
                      hint: 'Password',
                      icon: Image.asset('assets/images/hide_icon.png'),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AddAddressScreen.routeName);
                      },
                      child: Text('Sign Up'),
                    ),
                    Spacer(),
                    OptionButton(
                      desc: 'Have an account? ',
                      method: 'Login',
                      onPressHandler: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
