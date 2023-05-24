

import 'package:flutter/material.dart';

import '../ui_helper.dart';

class customTextField extends StatelessWidget {

 TextEditingController mController;
 Color mFillcolor;
 IconData mIcon;



 customTextField ({required this.mController,
   required this.mFillcolor,
   required this.mIcon,
   });

 @override
  Widget build(BuildContext context) {
    return TextField(
      style: mTextStyleThin (mfontSize: 15, mColor: Theme.of(context).canvasColor),
      controller:mController,
      decoration: InputDecoration (
        prefixIcon: Icon(mIcon),
          iconColor: Theme.of(context).backgroundColor,
          prefixIconColor: Theme.of(context).backgroundColor,
        fillColor: mFillcolor,
        filled: true,
          focusColor: Theme.of(context).backgroundColor,
        border: OutlineInputBorder (
        borderRadius: BorderRadius.circular(18),
        )
      ),

    );

  }
}
