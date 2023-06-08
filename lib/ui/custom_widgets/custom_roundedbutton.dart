
import 'package:expentappbysir/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class customRoundedButton extends StatelessWidget {

  VoidCallback callback;
  String text;
  Widget? mchild;

  customRoundedButton ({required this.callback, required this.text, this.mchild});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: callback, 
        child: mchild ?? Text(text, style: mTextStyleBold(mfontSize: 17,
            mColor: Theme.of(context).backgroundColor)),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).brightness == Brightness.light ?
        MyColor.secondaryBColor :  MyColor.secondaryWColor,
      ),
    );
  }
}
