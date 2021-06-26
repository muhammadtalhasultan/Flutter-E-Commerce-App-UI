import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../screens/order_summary_screen.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_input_button.dart';
import '../widgets/discount_text.dart';
import '../widgets/fruit_title.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/price_tag.dart';
import '../widgets/quantity_input.dart';
import '../widgets/tab_title.dart';

class DragonFruitScreen extends StatefulWidget {
  static const routeName = '/dragonFruit';

  @override
  _DragonFruitScreenState createState() => _DragonFruitScreenState();
}

class _DragonFruitScreenState extends State<DragonFruitScreen> {
  final textController = TextEditingController(text: '1');
  bool isReviewTab = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      'Dragon Fruit',
                      [
                        SizedBox(
                          width: getProportionateScreenWidth(24),
                          child: Image.asset(
                            'assets/images/cart_nav_fill.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(16),
                        ),
                        Icon(
                          Icons.share,
                          color: kPrimaryGreen,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(300),
                      width: double.infinity,
                      child: ImagePlaceholder(),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DiscoutText(),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          FruitTitle(title: 'Fruit\'s Bundle'),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          Text(
                            '200gr',
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      color: kTextColorAccent,
                                    ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PreviousPriceTag(),
                              SizedBox(
                                width: getProportionateScreenWidth(8),
                              ),
                              PriceTag(),
                              Spacer(),
                              CustomIconButton(Icons.remove, () {
                                setState(() {
                                  int quantity = int.parse(textController.text);
                                  quantity--;
                                  textController.text = quantity.toString();
                                });
                              }),
                              SizedBox(
                                width: getProportionateScreenWidth(4),
                              ),
                              QuantityInput(textController: textController),
                              SizedBox(
                                width: getProportionateScreenWidth(4),
                              ),
                              CustomIconButton(Icons.add, () {
                                setState(() {
                                  int quantity = int.parse(textController.text);
                                  quantity++;
                                  textController.text = quantity.toString();
                                });
                              }),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8.0),
                          ),
                          Container(
                            height: getProportionateScreenHeight(
                              32,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(2),
                              horizontal: getProportionateScreenWidth(4),
                            ),
                            decoration: ShapeDecoration(
                              color: kFillColorThird,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(8.0),
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!isReviewTab) {
                                        return;
                                      }

                                      setState(() {
                                        isReviewTab = !isReviewTab;
                                      });
                                    },
                                    child: DetailSelection(
                                      'Detail Items',
                                      !isReviewTab,
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  endIndent: getProportionateScreenHeight(4),
                                  indent: getProportionateScreenHeight(4),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (isReviewTab) {
                                        return;
                                      }

                                      setState(() {
                                        isReviewTab = !isReviewTab;
                                      });
                                    },
                                    child: DetailSelection(
                                      'Reviews',
                                      isReviewTab,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(16),
                          ),
                          !isReviewTab
                              ? Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color: kTextColorAccent,
                                      ),
                                )
                              : Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ReviewCard(),
                                    ReviewCard(),
                                    OutlinedButton(
                                        onPressed: () {},
                                        child: Text('See All Reviews'))
                                  ],
                                ),
                          Divider(
                            height: getProportionateScreenHeight(48),
                          ),
                          TabTitle(
                            title: 'More Like this',
                            padding: 0,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(220),
                            child: Row(
                              children: [
                                Expanded(
                                  child: IndiDealCard(
                                    noPadding: true,
                                    isSelected: true,
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(8),
                                ),
                                Expanded(
                                  child: IndiDealCard(
                                    noPadding: true,
                                    isSelected: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(48),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(OrderSummaryScreen.routeName);
                      },
                      child: SizedBox(
                        width: getProportionateScreenWidth(32),
                        child: Image.asset(
                          'assets/images/cart_nav_fill.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(16),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenHeight(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kGreyShade5,
                      radius: getProportionateScreenWidth(24.0),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(8),
                    ),
                    UserDetails(),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: kTextColorAccent,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shoo Thar Mien',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(17.0),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(Icons.more_vert_rounded),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: getProportionateScreenWidth(4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              Text(
                '29 February, 2099',
                style: TextStyle(
                  color: kTextColorAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DetailSelection extends StatelessWidget {
  final String text;
  final bool isSelected;

  const DetailSelection(this.text, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: isSelected
          ? ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8.0),
                ),
              ),
              shadows: [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  )
                ])
          : null,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PreviousPriceTag extends StatelessWidget {
  const PreviousPriceTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Divider2.png'),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(8),
        ),
        decoration: ShapeDecoration(
          color: kFailColor.withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8.0),
            ),
          ),
        ),
        child: Text(
          '\$126',
          style: TextStyle(
            color: kFailColor,
          ),
        ),
      ),
    );
  }
}
