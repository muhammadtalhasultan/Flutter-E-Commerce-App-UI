import 'package:flutter/material.dart';
import '../widgets/custom_input_button.dart';
import '../widgets/fruit_title.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/price_tag.dart';
import '../widgets/quantity_input.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_app_bar.dart';

class FruitScreen extends StatefulWidget {
  static const routeName = '/fruit_screen';

  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  final textController = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      'Grapes (500gr)',
      'Apples (250gr)',
      'Mango (300gr)',
      'Jackfruit (50gr)',
      'Oranges (1kg)',
      'Grapes (500gr)',
      'Oranges (1kg)',
      'Grapes (500gr)',
      'Oranges (1kg)',
      'Grapes (500gr)',
    ];

    ScreenUtils().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              'Fruits bundle',
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
              height: getProportionateScreenHeight(16.0),
            ),
            Expanded(
              child: ImagePlaceholder(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(8),
                    horizontal: getProportionateScreenWidth(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FruitTitle(
                        title: 'Fruit\'s Bundle',
                      ),
                      Text(
                        'Total 10Kg',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: kTextColorAccent,
                            ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Row(
                        children: [
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
                        height: getProportionateScreenHeight(8),
                      ),
                      Row(
                        children: [
                          Text(
                            'Detail items',
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          Spacer(),
                          Image.asset('assets/images/edit.png'),
                        ],
                      ),
                      ...List.generate(
                        ingredients.length,
                        (index) => Text(
                          ingredients[index],
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: kTextColorAccent,
                              ),
                        ),
                      ),
                    ],
                  ),
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
                      onPressed: () {},
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
