

import 'package:expentappbysir/ui/custom_widgets/custom_logo.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_roundedbutton.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_textfield.dart';
import 'package:expentappbysir/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {


  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MediaQuery.of(context).size.height> 350 ? mainUI() : SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customLogo( mSize: 30,
                  mBgColor: Theme.of(context).canvasColor,
                  mIconColor: Theme.of(context).backgroundColor,),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello Again', style: mTextStyleBold(mfontSize: 22, mColor: Theme.of(context).canvasColor,)),
                    Image.asset('assets/images/wave.png', width: 25, height: 25),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Welcome back, you have been missed!',
                    style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 12)),

                SizedBox(
                  height: 10,
                ),

                /////////////////////////////////////////////////////////////////////////////


                customTextField (mController: emailcontroller,
                  mIcon: Icons.email_outlined,
                  mFillcolor: Theme.of(context).brightness == Brightness.light
                      ? MyColor.secondaryWColor: MyColor.secondaryBColor,),
                SizedBox(
                  height: 10,
                ),

                customTextField (mController: passwordcontroller ,
                  mIcon: Icons.lock_outline,
                  mFillcolor:Theme.of(context).brightness == Brightness.light
                      ? MyColor.secondaryWColor : MyColor.secondaryBColor,),
                SizedBox(
                  height: 20,
                ),


                Row (
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget Password?', style:
                    mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: customRoundedButton(callback: () {}, text: 'Log In')),

              ],
            ),
          ),
        ),
      )

    );
  }

  Widget mainUI () {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 21, right: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customLogo( mSize: 30,
              mBgColor: Theme.of(context).canvasColor,
              mIconColor: Theme.of(context).backgroundColor,),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello Again', style: mTextStyleBold(mfontSize: 22, mColor: Theme.of(context).canvasColor,)),
                Image.asset('assets/images/wave.png', width: 25, height: 25),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('Welcome back, you have been missed!',
                style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 12)),

            SizedBox(
              height: 10,
            ),

            /////////////////////////////////////////////////////////////////////////////


            customTextField (mController: emailcontroller,
              mIcon: Icons.email_outlined,
              mFillcolor: Theme.of(context).brightness == Brightness.light
                  ? MyColor.secondaryWColor: MyColor.secondaryBColor,),
            SizedBox(
              height: 10,
            ),

            customTextField (mController: passwordcontroller ,
              mIcon: Icons.lock_outline,
              mFillcolor:Theme.of(context).brightness == Brightness.light
                  ? MyColor.secondaryWColor : MyColor.secondaryBColor,),
            SizedBox(
              height: 20,
            ),


            Row (
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forget Password?', style:
                mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))
              ],
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
                width: double.infinity,
                height: 40,
                child: customRoundedButton(callback: () {}, text: 'Log In')),

          ],
        ),
      ),
    );
  }
}
