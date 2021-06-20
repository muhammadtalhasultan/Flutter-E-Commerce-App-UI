import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final Function seeAll;

  const TabTitle(this.title, this.seeAll);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          16,
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
              'See All',
            ),
          ),
        ],
      ),
    );
  }
}
