import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final String actionText;
  final Function seeAll;
  final double padding;

  const TabTitle(
      {this.title,
      this.seeAll,
      this.actionText = 'See All',
      this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          padding,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextButton(
            onPressed: seeAll,
            child: Text(
              actionText,
            ),
          ),
        ],
      ),
    );
  }
}
