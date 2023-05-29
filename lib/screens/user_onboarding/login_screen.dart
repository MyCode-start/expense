

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
      body: MediaQuery.of(context).size.height> 440 ? mainUI() : SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(21),
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
                Text('Welcome back, you\'ve been missed!',
                    style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 12)),

                SizedBox(
                  height: 10,
                ),

                /////////////////////////////////////////////////////////////////////////////


                customTextField (mController: emailcontroller,
                  mIcon: Icons.email_outlined,
                  isPassword: false,
                  mFillcolor: Theme.of(context).brightness == Brightness.light
                      ? MyColor.secondaryWColor: MyColor.secondaryBColor,),
                SizedBox(
                  height: 10,
                ),

                customTextField (mController: passwordcontroller ,
                  mIcon: Icons.lock_outline,
                  isPassword: true,
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

    var width = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 21, right: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            width > 600 ? customLogo( mSize: 40,
              mBgColor: Theme.of(context).canvasColor,
              mIconColor: Theme.of(context).backgroundColor,): customLogo( mSize: 30,
              mBgColor: Theme.of(context).canvasColor,
              mIconColor: Theme.of(context).backgroundColor,),
            SizedBox(
              height: 10,
            ),
            width > 600 ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello, Again', style: mTextStyleBold(mfontSize: 28, mColor: Theme.of(context).canvasColor,)),
                Image.asset('assets/images/wave.png', width: 35, height: 35),
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello, Again', style: mTextStyleBold(mfontSize: 15, mColor: Theme.of(context).canvasColor,)),
                Image.asset('assets/images/wave.png', width: 22, height: 22),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            width > 600 ? Text('Welcome back, you\'ve been missed!',
                style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 14)) : Text('Welcome back, you\'ve been missed!',
                style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 10)),

            SizedBox(
              height: 10,
            ),

            /////////////////////////////////////////////////////////////////////////////


            customTextField (mController: emailcontroller,
              mIcon: Icons.email_outlined,
                isPassword: false,
              mFillcolor: Theme.of(context).brightness == Brightness.light
                  ? MyColor.secondaryWColor: MyColor.secondaryBColor,),
            SizedBox(
              height: 10,
            ),

            customTextField (mController: passwordcontroller ,
              mIcon: Icons.lock_outline,
              isPassword: true,
              mFillcolor:Theme.of(context).brightness == Brightness.light
                  ? MyColor.secondaryWColor : MyColor.secondaryBColor,),
            SizedBox(
              height: 20,
            ),


            Row (
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forget Password?', style:
                mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 11))
              ],
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
                width: double.infinity,
                height: 40,
                child: customRoundedButton(callback: () {}, text: 'Log In', )),

            SizedBox(
              height: 20,
            ),

            MediaQuery.of(context).size.width >300 ? Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have registration yet?', style:
                mTextStyleThin(mColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor, mfontSize: 12)),
                TextButton(
                  onPressed: () {


                }, child: Text ('Register Now', style:
                mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))

                ),

              ],
            ) : Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have registration yet?', style:
                mTextStyleThin(mColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor, mfontSize: 12)),
                TextButton(
                    onPressed: () {


                    }, child: Text ('Register Now', style:
                mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))

                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
