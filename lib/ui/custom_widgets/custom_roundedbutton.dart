
import 'package:expentappbysir/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class customRoundedButton extends StatelessWidget {

  VoidCallback callback;
  String text;

  customRoundedButton ({required this.callback, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: callback, 
        child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).brightness == Brightness.light ?
        MyColor.secondaryWColor :  MyColor.secondaryBColor,
      ),
    );
  }
}
