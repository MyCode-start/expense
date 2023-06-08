

import 'package:flutter/material.dart';

class addExpenses extends StatelessWidget {
  const addExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Expanded(
          flex: 1,
            child: Row (
              children: [
                Text ('Cancel'),
                Text('Expense'),
                SizedBox(),
              ],

            )),

        Expanded(
            flex: 5,
            child: Container (
              color: Colors.pinkAccent,
            )),

        Expanded(
            flex: 1,
            child: Container (
              color: Colors.purpleAccent,
            )),

        Expanded(
            flex: 1,
            child: Container (
              color: Colors.pinkAccent,
            )),

        Expanded(
            flex: 5,
            child: Container (
              color: Colors.purpleAccent,
            )),

      ],
    );



  }
}
