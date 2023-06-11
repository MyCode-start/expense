

import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../ui/ui_helper.dart';

class addExpenses extends StatefulWidget {

  @override
  State<addExpenses> createState() => _addExpensesState();
}

class _addExpensesState extends State<addExpenses> {
  var amountcontroller = TextEditingController();

  /*var textfinal= 0;
  var displaytext;*/

   var displayText = "";
   var _selectedIndex = -1;

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
                      TextField(
                          controller: amountcontroller,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          enabled: false,
                          /*onChanged: (value){

                            /*textfinal= int.parse(value.toString());
                            displaytext = (textfinal/ 89).toStringAsFixed(2);*/
                            setState(() {
                              displayText = value;
                            });
                          },*/
                          decoration: InputDecoration(
                           prefixIcon: Icon(Icons.currency_rupee_outlined, color: Theme.of(context).canvasColor, size: 25),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card),
                            Text('Credit Card'),
                          ],
                        )
                      ),




                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(21),
                            color: Theme.of(context).canvasColor.withOpacity(0.1),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                showModalBottomSheet(context: context,
                                    backgroundColor: Theme.of(context).canvasColor,
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21))
                                    ),
                                    builder:(context){
                                  return GridView.builder(
                                      itemCount: Constants.arrCategories.length,
                                      shrinkWrap: true,
                                      gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
                                      itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              _selectedIndex = index;
                                              setState(() {});
                                            },
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                child: Image.asset(Constants.arrCategories[index]['image'] ?? '')),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(Constants.arrCategories[index]['name'] ?? '',
                                              style: mTextStyleThin(mfontSize: 12 ,
                                                  mColor: Theme.of(context).backgroundColor)),
                                        ],
                                      ),
                                    );
                                      });
                                });
                              },
                              child: _selectedIndex == -1 ?

                                  Row(
                                    children: [
                                      Text("Unselected", textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).canvasColor,
                                fontWeight: FontWeight.bold,
                              )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text ('(--)', textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ) : Row(
                                children: [
                                  Text(Constants.arrCategories[_selectedIndex]['name'] ?? '', textAlign: TextAlign.center, style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).canvasColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(Constants.arrCategories[_selectedIndex]['image'] ?? '')),

                                ],
                              )
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(21),
                            color: Theme.of(context).canvasColor.withOpacity(0.1),
                          ),
                          child: MaterialButton(
                              onPressed: () {},
                              child: Text("Save", textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).canvasColor,
                                fontWeight: FontWeight.bold,
                              ))
                          ),
                        ),
                      )





                    ],
                  )
                )),

            Expanded(
              flex: 5,
              child: buildNumberPad(),
            ),

          ],
        ),
    );
  }



  buildNumberPad() {
    return Container(
      /*alignment: Alignment.bottomCenter,*/
      child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
        child: (
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    KeyboardNumber(
                      n: 1,
                      onPressed: () {IndexSetup("1");},
                    ),

                    KeyboardNumber(
                      n: 2,
                      onPressed: () { IndexSetup("2");},
                    ),

                    KeyboardNumber(
                      n: 3,
                      onPressed: () { IndexSetup("3");},
                    )

                  ],
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    KeyboardNumber(
                      n: 4,
                      onPressed: () {IndexSetup("4");},
                    ),

                    KeyboardNumber(
                      n: 5,
                      onPressed: () {IndexSetup("5");},
                    ),

                    KeyboardNumber(
                      n: 6,
                      onPressed: () {IndexSetup("6");},
                    )

                  ],
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    KeyboardNumber(
                      n: 7,
                      onPressed: () {IndexSetup("7");},
                    ),

                    KeyboardNumber(
                      n: 8,
                      onPressed: () {IndexSetup("8");},
                    ),

                    KeyboardNumber(
                      n: 9,
                      onPressed: () {IndexSetup("9");},
                    )

                  ],
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [

                    Container(
                      width: 60,
                      child: MaterialButton(
                        onPressed: null,
                        child: SizedBox(),
                      )
                    ),

                    KeyboardNumber(
                      n: 0,
                      onPressed: () {IndexSetup("0");},
                    ),

                    Container(
                      width: 60,
                        child: MaterialButton(
                          height: 60,
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(60),
                          ),
                          onPressed: () {removeLastDigit();},
                          child: Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.white),
                        )
                    )

                  ],
                ),
              ],
            )
        ),
      )
    );
  }
  IndexSetup(String text) {
    setState(() {
      displayText += text;
      amountcontroller.text = displayText;
    });
  }
  removeLastDigit() {
    setState(() {
      if (displayText.length > 1) {
        displayText = displayText.substring(0, displayText.length - 1);
        amountcontroller.text = displayText;
      } else {
        displayText = "";
        amountcontroller.clear();
      }
    });
  }

}

class KeyboardNumber extends StatelessWidget {
 final int n;
 final Function() onPressed;

  KeyboardNumber({required this.n, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration (
        shape: BoxShape.circle,
        color: Theme.of(context).canvasColor.withOpacity(0.1),
      ),
        /*alignment: Alignment.center,*/
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder (
          borderRadius: BorderRadius.circular(40),
        ),
          height:90,
        child: Text("$n", textAlign: TextAlign.center, style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).canvasColor,
          fontWeight: FontWeight.bold,
        ))
      )
    );
  }
}
