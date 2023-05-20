

import 'package:flutter/material.dart';

class customLogo extends StatelessWidget {

  double mSize;
  Color mBgColor;
  Color mIconColor;

  customLogo({required this.mSize, required this.mBgColor, required this.mIconColor});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircleAvatar (
          backgroundColor: mBgColor,
          radius: mSize,
          child: Center(
            child: ImageIcon(
            AssetImage('assets/images/expenses.png'),
            size: mSize,
            color: mIconColor,
        ),

          ),

        ),
      );
  }
}
