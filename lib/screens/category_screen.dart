import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/category.dart';
import '../utils/screen_utils.dart';
import '../widgets/category_card.dart';
import '../widgets/custom_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category_screen';
  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        'Vegetables',
        'assets/images/vegetable.png',
        kAccentGreen,
      ),
      Category(
        'Fruits',
        'assets/images/fruit.png',
        kAccentRed,
      ),
      Category(
        'Milks & egg',
        'assets/images/egg.png',
        kAccentYellow,
      ),
      Category(
        'Meat',
        'assets/images/meat.png',
        kAccentPurple,
      ),
      Category(
        'Bread',
        'assets/images/bread.png',
        kAccentTosca,
      ),
      Category(
        'Fish',
        'assets/images/seafood.png',
        kAccentGreen,
      ),
      Category(
        'Cookies',
        'assets/images/cereal.png',
        kAccentRed,
      ),
      Category(
        'Herbs',
        'assets/images/herbs.png',
        kAccentYellow,
      ),
      Category(
        'Drinks',
        'assets/images/drinks.png',
        kAccentPurple,
      ),
      Category(
        'Ice Cream',
        'assets/images/cannedfood.png',
        kAccentTosca,
      ),
      Category(
        'Cheese',
        'assets/images/dairy.png',
        kAccentGreen,
      ),
      Category(
        'Chips',
        'assets/images/cereal.png',
        kAccentRed,
      ),
    ];
    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              'Categories',
              [
                Icon(
                  Icons.search,
                  color: kPrimaryGreen,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Expanded(
                child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  categories[index],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
