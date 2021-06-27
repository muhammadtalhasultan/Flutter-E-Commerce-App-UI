import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/indi_deal_card.dart';

import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';

class PopularDealsScreen extends StatefulWidget {
  static const routeName = '/popular_deals';

  @override
  _PopularDealsScreenState createState() => _PopularDealsScreenState();
}

class _PopularDealsScreenState extends State<PopularDealsScreen> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  'Popular Deals',
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
                CustomStaggerGrid(() {
                  setState(() {
                    isAdded = true;
                  });
                }),
              ],
            ),
          ),
          if (isAdded)
            Positioned(
              bottom: getProportionateScreenHeight(40),
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16.0),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16.0),
                ),
                height: getProportionateScreenHeight(80),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8.0),
                    ),
                  ),
                  color: kPrimaryGreen,
                  shadows: [
                    BoxShadow(
                      color: kShadowColor,
                      offset: Offset(
                        getProportionateScreenWidth(24),
                        getProportionateScreenWidth(40),
                      ),
                      blurRadius: 80,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5 items',
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          Flexible(
                            child: Text(
                              'Dragon Fruits, Oranges, Apples, Dragon Fruits, Oranges, Apples, ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Text(
                      '\$240',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !isAdded
          ? RawMaterialButton(
              fillColor: Colors.white,
              shape: StadiumBorder(),
              elevation: 10.0,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(8.0),
                  horizontal: getProportionateScreenWidth(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/sort.png'),
                    Text(
                      'Sort & Filter',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}

class CustomStaggerGrid extends StatelessWidget {
  final Function addCallback;

  const CustomStaggerGrid(this.addCallback);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 10,
          crossAxisSpacing: getProportionateScreenWidth(8),
          mainAxisSpacing: getProportionateScreenHeight(8),
          itemBuilder: (ctx, index) {
            if (index % 2 != 0) {
              return IndiDealCard(
                isLeft: false,
                isSelected: false,
              );
            } else if (index == 0) {
              return IndiDealCard(
                isLeft: true,
                isSelected: true,
                addHandler: addCallback,
              );
            }
            return IndiDealCard(
              isLeft: true,
              isSelected: false,
            );
          },
          staggeredTileBuilder: (index) {
            if (index == 0 || index == 2 || index == 3)
              return StaggeredTile.count(1, 1.3);
            return StaggeredTile.count(1, 2);
          }),
    );
  }
}
