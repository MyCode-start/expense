import 'package:expentappbysir/bloc/for_expense/expense_bloc.dart';
import 'package:expentappbysir/screens/home/frags/frag_transaction/add_expenses.dart';
import 'package:expentappbysir/screens/home/homescreen.dart';
import 'package:expentappbysir/screens/splash/splash_screen.dart';
import 'package:expentappbysir/ui/ui_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/for_category/expense_type_bloc.dart';
import 'db_helper.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ExpenseBloc>(
      create: (BuildContext context) => ExpenseBloc(dbHelper: DBHelper()),
    ),

    BlocProvider<ExpenseTypeBloc>(
      create: (BuildContext context) => ExpenseTypeBloc(),
    ),
  ], child: const MyApp(),));
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


      home: addExpenses(),
    );
  }
}
