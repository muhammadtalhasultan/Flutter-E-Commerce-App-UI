import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Spacer(),
          ElevatedButton(onPressed: () {}, child: Text('123')),
          OutlinedButton(
            onPressed: () {},
            child: Text('124'),
          ),
          Spacer()
        ],
      ),
    ));
  }
}
