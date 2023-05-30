
import 'package:flutter/material.dart';

import '../../../ui/custom_widgets/custom_logo.dart';
import '../../../ui/custom_widgets/custom_roundedbutton.dart';
import '../../../ui/custom_widgets/custom_textfield.dart';
import '../../../ui/ui_helper.dart';
import '../login/login_screen.dart';

class signupScreen extends StatefulWidget {

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {

  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        body: MediaQuery.of(context).size.height > 600 ? mainSUI() : SingleChildScrollView(
          child: mainSUI(),
        )
    );
  }

  Widget mainSUI() {

    var width = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
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
                Text('Get Started', style: mTextStyleBold(mfontSize: 28, mColor: Theme.of(context).canvasColor,)),
                Image.asset('assets/images/wave.png', width: 35, height: 35),
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get Started', style: mTextStyleBold(mfontSize: 15, mColor: Theme.of(context).canvasColor,)),
                Image.asset('assets/images/wave.png', width: 22, height: 22),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            width > 600 ? Text('Start managing your expense today',
                style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 14)) :
            Text('Start managing your expense today',
                style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 12)),

            SizedBox(
              height: 10,
            ),






            ///////////////////////////////////////////////////

            customTextField(mController: usernamecontroller,
              mIcon: Icons.person_2_outlined,
              isPassword: false,
              mFillcolor: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? MyColor.secondaryWColor : MyColor.secondaryBColor,),
            SizedBox(
              height: 10,
            ),

            customTextField(mController: emailcontroller,
              mIcon: Icons.email_outlined,
              isPassword: false,
              mFillcolor: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? MyColor.secondaryWColor : MyColor.secondaryBColor,),
            SizedBox(
              height: 10,
            ),

            customTextField(mController: passwordcontroller,
              mIcon: Icons.lock_outline,
              isPassword: true,
              mFillcolor: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? MyColor.secondaryWColor : MyColor.secondaryBColor,),
            SizedBox(
              height: 10,
            ),

            customTextField(mController: confirmpasswordcontroller,
              mIcon: Icons.lock_outline,
              isPassword: true,
              mFillcolor: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? MyColor.secondaryWColor : MyColor.secondaryBColor,),

           /////////////////////////////////////////////////////

            SizedBox(
              height: 20,
            ),

            SizedBox(
                width: double.infinity,
                height: 40,
                child: customRoundedButton(callback: () {}, text: 'Sign Up', )),



            SizedBox(
              height: 20,
            ),

            MediaQuery.of(context).size.width >300 ? Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style:
                mTextStyleThin(mColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor, mfontSize: 12)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login_screen(),),
                      );

                    }, child: Text ('Login Now!', style:
                mTextStyleThin(mColor: Theme.of(context).canvasColor, mfontSize: 12))

                ),

              ],
            ) : Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style:
                mTextStyleThin(mColor: Theme.of(context).brightness== Brightness.light? MyColor.textWColor : MyColor.textBColor, mfontSize: 12)),
                TextButton(
                    onPressed: () {

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login_screen(),));


                    }, child: Text ('Login Now!', style:
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
