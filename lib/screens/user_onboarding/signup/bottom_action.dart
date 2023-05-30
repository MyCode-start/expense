

import 'package:flutter/material.dart';

import '../../../ui/ui_helper.dart';

List<Widget> getChildren(title, subtitle, action, context) {

  return [
    Text(title, style:
    mTextStyleThin(mColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor, mfontSize: 12)),
    TextButton(
        onPressed: action,
        child: Text (subtitle, style:
    mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))

    ),

  ];

}