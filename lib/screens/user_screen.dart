import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/my_profile_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/image_container.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            ImageContainer(),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            Text(
              'Shoo Phar Nhoe',
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              'shoophar@email.com',
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: kTextColorAccent,
                  ),
            ),
            Divider(
              height: getProportionateScreenHeight(32.0),
            ),
            ProfileCard(
              image: 'assets/images/profile_user.png',
              color: kAccentGreen,
              title: 'My profile',
              tapHandler: () {
                Navigator.of(context).pushNamed(MyProfileScreen.routeName);
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            ProfileCard(
              image: 'assets/images/map_user.png',
              color: kAccentTosca,
              title: 'My Address',
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            ProfileCard(
              image: 'assets/images/noti_user.png',
              color: kAccentYellow,
              title: 'Notification',
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            ProfileCard(
              image: 'assets/images/check_user.png',
              color: kAccentPurple,
              title: 'Help Center',
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            ),
            ProfileCard(
              image: 'assets/images/arrow_user.png',
              color: kAccentRed,
              title: 'Log out',
            ),
            Spacer(),
            Text(
              'ver 1.01',
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: kTextColorAccent,
                  ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(8.0),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
    @required this.image,
    @required this.title,
    this.tapHandler,
    @required this.color,
  }) : super(key: key);

  final String image;
  final String title;
  final Function tapHandler;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapHandler,
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: kShadowColor.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(8.0),
              ),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8.0),
                  ),
                ),
              ),
              child: Image.asset(image),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8.0),
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
