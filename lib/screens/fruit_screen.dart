import 'package:flutter/material.dart';
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
            ImagePlaceholder(),
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
                      Title(),
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

class QuantityInput extends StatelessWidget {
  const QuantityInput({
    Key key,
    @required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(40),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8),
            ),
            borderSide: BorderSide(
              color: kGreyShade3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8),
            ),
            borderSide: BorderSide(
              color: kGreyShade3,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(6),
            horizontal: getProportionateScreenWidth(4),
          ),
        ),
        style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  const PriceTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(8.0),
        horizontal: getProportionateScreenWidth(16.0),
      ),
      decoration: ShapeDecoration(
        color: kAccentGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(8.0),
          ),
        ),
      ),
      child: Text(
        '\$56',
        style: Theme.of(context).textTheme.headline3.copyWith(
              color: kPrimaryGreen,
            ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  const CustomIconButton(this.icon, this.onPress);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kGreyShade5,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenWidth(40),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(8.0),
        ),
      ),
      onPressed: onPress,
      child: Icon(
        icon,
        color: kGreyShade1,
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Fruit\'s Boundle',
            style: Theme.of(context).textTheme.headline3.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Icon(
          Icons.favorite_border_outlined,
          color: kPrimaryGreen,
          size: getProportionateScreenWidth(32),
        )
      ],
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: kGreyShade5,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(16.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: kGreyShade1,
                    radius: getProportionateScreenWidth(4),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(8.0),
                  ),
                  CircleAvatar(
                    backgroundColor: kGreyShade3,
                    radius: getProportionateScreenWidth(4),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(8.0),
                  ),
                  CircleAvatar(
                    backgroundColor: kGreyShade3,
                    radius: getProportionateScreenWidth(4),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(8.0),
                  ),
                  CircleAvatar(
                    backgroundColor: kGreyShade3,
                    radius: getProportionateScreenWidth(4),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
