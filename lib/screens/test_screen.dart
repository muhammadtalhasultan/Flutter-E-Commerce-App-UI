import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const routeName = '/test';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                height: 1000,
              ),
              Container(
                color: Colors.blue,
                height: 1000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
