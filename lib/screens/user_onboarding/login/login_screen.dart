

import 'package:expentappbysir/screens/home/homescreen.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_logo.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_roundedbutton.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_textfield.dart';
import 'package:expentappbysir/ui/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../forgetpas/forgetpassword.dart';
import '../signup/sign_up_screen.dart';


class login_screen extends StatefulWidget {


  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {


  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MediaQuery.of(context).orientation == Orientation.portrait ?
      MediaQuery.of(context).size.height> 500 ? mainUI() : SingleChildScrollView(
        child: mainUI()
      ) :  Row(
        children: [
          Expanded(flex: 1, child: Container(
            height: 800,
            color: Theme.of(context).brightness== Brightness.light? MyColor.bgBColor : MyColor.bgWColor,
            child: ImageIcon(AssetImage('assets/images/loginimage.png',),
              color: Theme.of(context).brightness== Brightness.light? MyColor.bgWColor : MyColor.bgBColor,),
          )),
          Expanded(flex: 1, child: MediaQuery.of(context).size.height> 500 ? mainUI() : SingleChildScrollView(
              child: mainUI()
          ) )
        ],
      ),
    );
  }

  Widget mainUI () {

    var width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints)=> Center(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                constraints.maxWidth > 600 ? customLogo( mSize: 40,
                  mBgColor: Theme.of(context).canvasColor,
                  mIconColor: Theme.of(context).backgroundColor,): customLogo( mSize: 30,
                  mBgColor: Theme.of(context).canvasColor,
                  mIconColor: Theme.of(context).backgroundColor,),
                SizedBox(
                  height: 10,
                ),
                constraints.maxWidth > 500 ? Row(
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
                constraints.maxWidth > 500 ? Text('Welcome back, you\'ve been missed!',
                    style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 14)) : Text('Welcome back, you\'ve been missed!',
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
                    TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => forgetpassword()),
                      );

                      }, child: Text ('Forget Password?', style:
                    mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 11)),
                    ),
                  ]
                ),

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: customRoundedButton(callback: () {

                      if (_formKey.currentState!.validate()) {
                        /*ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Row(
                            children: [
                              Icon(Icons.downloading, color: Theme.of(context).brightness ==
                                  Brightness.light? MyColor.bgWColor : MyColor.bgBColor),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Processing Data'),
                           ],
                          )),


                        );*/

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => homescreen()),
                        );

                        /*Fluttertoast.showToast(
                          msg: "Show Long Toast",
                          toastLength: Toast.LENGTH_LONG,);*/

                      }
                    }, text: 'Log In', )),

                SizedBox(
                  height: 20,
                ),

                constraints.maxWidth >450 ? Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have registration yet?', style:
                    mTextStyleThin(mColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor, mfontSize: 12)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signupScreen()),
                          );

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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signupScreen()),
                          );

                        }, child: Text ('Register Now', style:
                    mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))

                    ),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*Center(
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
        ),*/