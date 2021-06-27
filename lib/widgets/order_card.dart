import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../constants/colors.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_input_button.dart';
import '../widgets/small_quantity_input.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key key,
    this.isSelected = false,
    this.onTapHandler,
  }) : super(key: key);

  final bool isSelected;
  final Function() onTapHandler;

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  final textController = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        height: getProportionateScreenHeight(88),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8.0),
            ),
          ),
          color: widget.isSelected ? Colors.white : Colors.transparent,
          shadows: widget.isSelected
              ? [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(
                      getProportionateScreenWidth(24),
                      getProportionateScreenWidth(40),
                    ),
                    blurRadius: 80,
                  )
                ]
              : [],
        ),
        padding: EdgeInsets.all(
          getProportionateScreenWidth(4.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: getProportionateScreenWidth(80),
              decoration: ShapeDecoration(
                color: kGreyShade5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dragon Fruit',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    '200gr',
                    style: TextStyle(
                      color: kTextColorAccent,
                      fontSize: getProportionateScreenWidth(
                        12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$45',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      CustomIconButton(
                        Icons.remove,
                        () {
                          setState(() {
                            int quantity = int.parse(textController.text);
                            quantity--;
                            textController.text = quantity.toString();
                          });
                        },
                        size: 32,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(4),
                      ),
                      SmallQuantityInput(
                        textController: textController,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(4),
                      ),
                      CustomIconButton(
                        Icons.add,
                        () {
                          setState(() {
                            int quantity = int.parse(textController.text);
                            quantity++;
                            textController.text = quantity.toString();
                          });
                        },
                        size: 32,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      actionExtentRatio: 0.25,
      secondaryActions: [
        SlideAction(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8.0),
            ),
            color: kAlertColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Trash Bin.png'),
              Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          onTap: widget.onTapHandler,
        )
      ],
    );
  }
}
