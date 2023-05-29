import 'package:expentappbysir/screens/splash/splash_screen.dart';
import 'package:expentappbysir/ui/ui_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: createMaterialColor(MyColor.bgBColor),
          backgroundColor: MyColor.bgBColor,
          canvasColor: MyColor.bgWColor,
          shadowColor: MyColor.lightTextBColor
      ),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: createMaterialColor(MyColor.bgWColor),
          backgroundColor: MyColor.bgWColor,
          canvasColor: MyColor.bgBColor,
          shadowColor: MyColor.lightTextWColor),


      home: splash_screen(),
    );
  }
}
