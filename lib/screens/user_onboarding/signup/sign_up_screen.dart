
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../ui/custom_widgets/custom_logo.dart';
import '../../../ui/custom_widgets/custom_roundedbutton.dart';
import '../../../ui/custom_widgets/custom_textfield.dart';
import '../../../ui/ui_helper.dart';
import '../../home/homescreen.dart';
import '../login/login_screen.dart';

class signupScreen extends StatefulWidget {

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {


  var valueone;
  var valuetwo;
  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        body: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height > 600 ? mainSUI() : SingleChildScrollView(
          child: mainSUI(),
        ) :  Row(
    children: [
    Expanded(flex: 1, child: Container(
      height: 800,
      color: Theme.of(context).brightness== Brightness.light? MyColor.bgBColor : MyColor.bgWColor,
      child: ImageIcon(AssetImage('assets/images/loginimage.png',),
        color: Theme.of(context).brightness== Brightness.light? MyColor.bgWColor : MyColor.bgBColor,),
    )),
    Expanded(flex: 1, child: MediaQuery.of(context).size.height> 600 ? mainSUI() : SingleChildScrollView(
    child: mainSUI()
    ) )
    ],
    ),


    );
  }

  Widget mainSUI() {

    var width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints)=>Center(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                constraints.maxWidth> 600 ? customLogo( mSize: 40,
                  mBgColor: Theme.of(context).canvasColor,
                  mIconColor: Theme.of(context).backgroundColor,): customLogo( mSize: 30,
                  mBgColor: Theme.of(context).canvasColor,
                  mIconColor: Theme.of(context).backgroundColor,),
                SizedBox(
                  height: 10,
                ),
                constraints.maxWidth > 600 ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Started!', style: mTextStyleBold(mfontSize: 28, mColor: Theme.of(context).canvasColor,)),
                  ],
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Started!', style: mTextStyleBold(mfontSize: 15, mColor: Theme.of(context).canvasColor,)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                constraints.maxWidth> 600 ? Text('Start managing your expense today',
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
                    child: customRoundedButton(callback: () {

                     valueone = passwordcontroller.text.toString();
                     valuetwo = confirmpasswordcontroller.text.toString();

                      if (_formKey.currentState!.validate()) {

                        if (valueone== valuetwo) {

                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => homescreen()),);

                        } else

                        {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Row(
                            children: [
                              Icon(Icons.downloading, color: Theme.of(context).brightness ==
                                  Brightness.light? MyColor.bgWColor : MyColor.bgBColor),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Incorrect Password'),
                            ],
                          )),
                        ); }

                        /*Fluttertoast.showToast(
                          msg: "Show Long Toast",
                          toastLength: Toast.LENGTH_LONG,);*/
                       }
                      }, text: 'Sign Up', )


                ),



                SizedBox(
                  height: 20,
                ),

                constraints.maxWidth>300 ? Row (
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
        ),
      ),
    );
  }
}
