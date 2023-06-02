

import 'package:flutter/material.dart';

import '../../../home/homescreen.dart';
import '../../../ui/custom_widgets/custom_logo.dart';
import '../../../ui/custom_widgets/custom_roundedbutton.dart';
import '../../../ui/custom_widgets/custom_textfield.dart';
import '../../../ui/ui_helper.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {

  final _formKey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                constraints.maxWidth > 600 ? Center(
                   child: CircleAvatar (
                     backgroundColor: Theme.of(context).canvasColor,
                      radius: 40,
                      child: Center(
                      child: ImageIcon(
                       AssetImage('assets/images/padlock.png'),
                      size: 40,
                       color:Theme.of(context).backgroundColor,
                        ),

                        ),

                      ),
                      )



                : Center(
                      child: CircleAvatar (
                        backgroundColor: Theme.of(context).canvasColor,
                        radius: 30,
                        child: Center(
                        child: ImageIcon(
                        AssetImage('assets/images/padlock.png'),
                         size: 30,
                          color:Theme.of(context).backgroundColor,
                         ),

                         ),

                         ),
                        ),


                SizedBox(
                  height: 10,
                ),
                constraints.maxWidth > 600 ?
                    Text('Forgot Password?', style: mTextStyleBold(mfontSize: 28, mColor: Theme.of(context).canvasColor,))
                   : Text('Forgot Password?', style: mTextStyleBold(mfontSize: 15, mColor: Theme.of(context).canvasColor,)),

                SizedBox(
                  height: 10,
                ),
                width > 600 ? Text('No worries, we\'ll send you reset instructions!',
                    style:  mTextStyleThin(mColor: Theme.of(context).shadowColor, mfontSize: 14)) : Text('No worries, we\'ll send you reset instructions!',
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

                SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: customRoundedButton(
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Check Email to Reset'),
                              action: SnackBarAction(
                                label: 'Open',
                                onPressed: () {},
                              ),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homescreen()),
                          );
                        }
                      },
                      text: 'Reset Password',
                    ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
