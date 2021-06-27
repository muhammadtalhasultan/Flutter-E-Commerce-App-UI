import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import '../screens/dragon_fruit_screen.dart';

import '../constants/colors.dart';
import '../screens/search_fruit_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/indi_deal_card_with_discount.dart';

class SpecialDealChildScreen extends StatelessWidget {
  static const routeName = '/specialDealChild';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              'Fruits',
              [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(SearchFruitScreen.routeName);
                  },
                  child: Icon(
                    Icons.search,
                    color: kPrimaryGreen,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
              ],
            ),
            HorizontalFruitsScroll(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: getProportionateScreenHeight(8.0),
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DragonFruitScreen.routeName);
                  },
                  child: IndiDealCardWithDiscount(
                    isLeft: index % 2 == 0,
                    isSelected: index == 0,
                    addHandler: () {
                      Flushbar(
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 3),
                        backgroundColor: kPrimaryRed,
                        icon: Image.asset('assets/images/delivery.png'),
                        padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(24.0),
                        ),
                        margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(
                            32,
                          ),
                        ),
                        message:
                            'Free shipping with a minimum purchase of \$ 100',
                      )..show(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalFruitsScroll extends StatefulWidget {
  const HorizontalFruitsScroll({
    Key key,
  }) : super(key: key);

  @override
  _HorizontalFruitsScrollState createState() => _HorizontalFruitsScrollState();
}

class _HorizontalFruitsScrollState extends State<HorizontalFruitsScroll> {
  int curIndex = 0;
  final List<Map<String, Object>> fruitVariety = [
    {
      'name': 'All',
      'index': 0,
    },
    {
      'name': 'Apples',
      'index': 1,
    },
    {
      'name': 'Avocado',
      'index': 2,
    },
    {
      'name': 'Banana',
      'index': 3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(64),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            fruitVariety.length,
            (index) => SelectionTab(
              text: fruitVariety[index]['name'],
              isSelected: curIndex == index,
              onTap: () {
                setState(() {
                  curIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SelectionTab extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;

  const SelectionTab({
    this.text,
    this.onTap,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(4.0),
        ),
        margin: EdgeInsets.only(
          left: getProportionateScreenWidth(16.0),
        ),
        constraints: BoxConstraints.tightFor(width: 96.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8.0),
          ),
          border: isSelected
              ? Border.all(
                  color: kPrimaryGreen,
                  width: 2,
                )
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? kPrimaryGreen : Colors.black,
          ),
        ),
      ),
    );
  }
}
