

import 'dart:async';
import 'package:expentappbysir/screens/user_onboarding/login_screen.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_logo.dart';
import 'package:flutter/material.dart';

import '../../ui/ui_helper.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login_screen(),
          ));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: customLogo(
              mSize: 50,
              mBgColor: Theme.of(context).canvasColor,
              mIconColor: Theme.of(context).backgroundColor,),
          ),
          SizedBox(
            height: 10,
          ),
          Text ('FAST EXPENSER', style: mTextStyleBold(mfontSize: 15,
              mColor: Theme.of(context).canvasColor),),
        ],
      ),
    );
  }
}
