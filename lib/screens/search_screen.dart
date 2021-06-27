import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';
import '../widgets/search_bar.dart';
import '../screens/vegetable_screen.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/deal_card.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/tab_title.dart';
import './fruit_screen.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchTab(),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DealCard(),
                    DealCard(),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              TabTitle(
                title: 'Featured Vegetables',
                seeAll: () {
                  Navigator.of(context).pushNamed(VegetableScreen.routeName);
                },
              ),
              Container(
                height: getProportionateScreenHeight(240),
                child: Row(
                  children: [
                    Expanded(
                      child: IndiDealCard(
                        isLeft: true,
                        isSelected: true,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(8.0),
                    ),
                    Expanded(
                      child: IndiDealCard(
                        isLeft: false,
                        isSelected: false,
                      ),
                    ),
                  ],
                ),
              ),
              TabTitle(
                title: 'Special Bundle',
                seeAll: () {},
              ),
              Container(
                height: getProportionateScreenHeight(240),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(FruitScreen.routeName);
                        },
                        child: IndiDealCard(
                          isLeft: true,
                          isSelected: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(8.0),
                    ),
                    Expanded(
                      child: IndiDealCard(
                        isLeft: false,
                        isSelected: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar((_) {}, 0),
    );
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: SearchBar('Search for Anything'),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Image.asset('assets/images/bell.png'),
        ],
      ),
    );
  }
}
