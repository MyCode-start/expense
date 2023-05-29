

import 'package:flutter/material.dart';

import '../ui_helper.dart';

class customTextField extends StatefulWidget {

 TextEditingController mController;
 Color mFillcolor;
 IconData mIcon;
 bool isPassword;



 customTextField ({required this.mController,
   required this.mFillcolor,
   required this.mIcon, required this.isPassword});

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {

  bool passVisible= false;

 @override
  Widget build(BuildContext context) {
    return widget.isPassword ? TextField(
      cursorColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor,
      style: mTextStyleThin (mfontSize: 17, mColor:  Theme.of(context).brightness == Brightness.light
          ? MyColor.textWColor
          : MyColor.textBColor),
      controller:widget.mController,
      obscureText: !passVisible,
      obscuringCharacter: "*",
      decoration: InputDecoration (
        prefixIcon: Icon(widget.mIcon),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton (
              icon: passVisible ? Icon(Icons.visibility_outlined) : Icon (Icons.visibility_off_outlined),
              onPressed: () {

                passVisible = !passVisible;
                setState(() {

                });

              },
            ),
          ),
          iconColor: Theme.of(context).backgroundColor,
          //prefixIconColor: Theme.of(context).backgroundColor,
        fillColor: widget.mFillcolor,
        filled: true,
          focusColor: Theme.of(context).backgroundColor,
        enabledBorder: OutlineInputBorder (
        borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide (
              width: 1,
              color: Theme.of(context).brightness== Brightness.light? MyColor.textBColor : MyColor.textWColor
          ),
        ),

        focusedBorder: OutlineInputBorder (
          borderSide: BorderSide (
            width: 1,
            color: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor
          ),
          borderRadius: BorderRadius.circular(18)
        )
      ),

    ) : TextField(
      cursorColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor,
      style: mTextStyleThin (mfontSize: 17, mColor:  Theme.of(context).brightness == Brightness.light
          ? MyColor.textWColor
          : MyColor.textBColor),
      controller:widget.mController,
      decoration: InputDecoration (
          prefixIcon: Icon(widget.mIcon),
          iconColor: Theme.of(context).backgroundColor,
          //prefixIconColor: Theme.of(context).backgroundColor,
          fillColor: widget.mFillcolor,
          filled: true,
          focusColor: Theme.of(context).backgroundColor,
          enabledBorder: OutlineInputBorder (
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide (
                width: 1,
                color: Theme.of(context).brightness== Brightness.light? MyColor.textBColor : MyColor.textWColor
            ),
          ),

          focusedBorder: OutlineInputBorder (
              borderSide: BorderSide (
                  width: 1,
                  color: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor
              ),
              borderRadius: BorderRadius.circular(18)
          )
      ),

    );

  }
}
