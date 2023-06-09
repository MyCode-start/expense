
import 'package:flutter/material.dart';

class MyColor {

  static const Color bgWColor = Color (0xffffffff);
  static const Color secondaryWColor = Color (0xffdbdbe1);
  static const Color textWColor = Color(0xff2c2c2c);
  static const Color lightTextWColor = Color(0xffb1b1b5);


  static const Color bgBColor = Color (0xff000000);
  static const Color secondaryBColor = Color (0xff737373);
  static const Color textBColor = Color(0xffffffff);
  static const Color lightTextBColor = Color(0xffcccccc);


}

MaterialColor createMaterialColor(Color color) {

  List strengths = <double>[.05];

  Map<int, Color> swatch = {};

  final int r = color.red, g = color.green, b = color.blue;



  for (int i = 1; i < 10; i++) {

    strengths.add(0.1 * i);

  }

  for (var strength in strengths) {

    final double ds = 0.5 - strength;

    swatch[(strength * 1000).round()] = Color.fromRGBO(

      r + ((ds < 0 ? r : (255 - r)) * ds).round(),

      g + ((ds < 0 ? g : (255 - g)) * ds).round(),

      b + ((ds < 0 ? b : (255 - b)) * ds).round(),

      1,

    );

  }

  return MaterialColor(color.value, swatch);

}




/*TextStyle mTextStyleBold({
  mColor = Colors.black,
   mfontSize= 30,
}){
  return TextStyle(
      fontWeight: FontWeight.bold,
      color: mColor,
      fontFamily: 'Roboto',
      fontSize: mfontSize,
  );
}*/

TextStyle mTextStyleBold({double mfontSize = 22, Color mColor = Colors.black}) {
  return TextStyle(
    fontSize: mfontSize, // Make sure mfontSize is of type double
    fontWeight: FontWeight.bold,
    color: mColor,
  );
}

/*TextStyle mTextStyleThin({
  mColor = Colors.black,
  mfontSize= 22,
  mfontWeight: FontWeight.normal,
}){
  return TextStyle(
      fontWeight: mfontWeight,
      color: mColor,
      fontFamily: 'Roboto',
      fontSize: mfontSize,
  );
}*/

TextStyle mTextStyleThin({
  Color mColor = Colors.black, // Specify the type as Color
  double mfontSize = 22, // Specify the type as double
  FontWeight mfontWeight = FontWeight.normal, // Specify the type as FontWeight
}) {
  return TextStyle(
    fontWeight: mfontWeight,
    color: mColor,
    fontFamily: 'Roboto',
    fontSize: mfontSize,
  );
}


TextStyle mTextStyleForTrans({
  Color mColor = Colors.black, // Specify the type as Color
  double mfontSize = 30, // Specify the type as double
  FontWeight mfontWeight = FontWeight.bold, // Specify the type as FontWeight
}) {
  return TextStyle(
    fontWeight: mfontWeight,
    color: mColor,
    fontFamily: 'Roboto',
    fontSize: mfontSize,
  );
}

/*TextStyle mTextStyleForTrans({
  mColor = Colors.black,
  mfontSize= 30,
  mfontWeight= FontWeight.bold,
}){
  return TextStyle(
    fontWeight: mfontWeight,
    color: mColor,
    fontFamily: 'Roboto',
    fontSize: mfontSize,
  );
}*/