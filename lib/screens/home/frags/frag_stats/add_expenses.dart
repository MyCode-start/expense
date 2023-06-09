

import 'package:flutter/material.dart';

import '../../../../ui/ui_helper.dart';

class addExpenses extends StatefulWidget {

  @override
  State<addExpenses> createState() => _addExpensesState();
}

class _addExpensesState extends State<addExpenses> {
  var amountcontroller = TextEditingController();

  var textfinal= 0;
  var displaytext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body:Column (
          children: [
            Expanded(
                flex: 1,
                child: Row (
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text ('Cancel', style: mTextStyleBold(mfontSize: 12, mColor:Theme.of(context).canvasColor))),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Expense', style: mTextStyleBold(mfontSize: 12, mColor:Theme.of(context).canvasColor)),
                        ],
                      ),
                    ),
                  ],

                )),

            Expanded(
                flex: 5,
                child: Container (
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\$ $displaytext', style: mTextStyleBold(mfontSize: 12, mColor:Theme.of(context).canvasColor)),
                      TextField(
                          controller: amountcontroller,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value){
                            textfinal= int.parse(value.toString());
                            displaytext = (textfinal/ 89).toStringAsFixed(2);
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                           prefixIcon: Icon(Icons.currency_rupee_outlined, color: Theme.of(context).canvasColor, size: 20),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).shadowColor, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).shadowColor, width: 1),
                            ),
                          )),
                    ],
                  ),
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
        ),
    );
  }
}
