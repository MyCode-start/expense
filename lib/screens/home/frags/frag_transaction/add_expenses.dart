

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/for_category/expense_type_bloc.dart';
import '../../../../constants.dart';
import '../../../../models/cat_model.dart';
import '../../../../ui/ui_helper.dart';

class addExpenses extends StatefulWidget {

  @override
  State<addExpenses> createState() => _addExpensesState();
}

class _addExpensesState extends State<addExpenses> {
  var amountcontroller = TextEditingController();
  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();

  List<CatModel> arrExpenseType = [];
  var defaultDropDownValue = 'Debit';

  List<String> arrTransType = ['Debit', 'Credit'];
  

  /*var textfinal= 0;
  var displaytext;*/

   var displayText = "";
   var _selectedIndex = -1;
   DateTime? datePicked;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpenseTypeBloc>(context).add(FetchAllCatExpenseType());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height > 800 ? PortUI() : SingleChildScrollView(
            child: PortUI(),
          ) :  MediaQuery.of(context).size.width > 500 ? LandscapeUI() : SingleChildScrollView(
    child: LandscapeUI(),
          )
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
                      onPressed: () {
                        IndexSetup("1");
                        },
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
                          color: Theme.of(context).shadowColor),
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

  Widget PortUI () {
    return Column (
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
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
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
                  ),
                ],
              )),

          Expanded(
              flex: 1,
              child: Container (
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Row(
                        children: [
                          TextButton(
                              onPressed: () async {
                                datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: datePicked ?? DateTime.now(), // Use the existing datePicked if available
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2023, 12, 31), // Updated last date
                                );

                                setState(() {});
                              },
                              child: Text(datePicked != null ? '${datePicked?.day.toString().padLeft(2,'0')}-${datePicked?.month.toString().padLeft(2, '0')}-${datePicked?.year}': 'DATE',
                                  textAlign: TextAlign.center, style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).shadowColor,
                                    fontWeight: FontWeight.bold,
                                  ))

                            /*datePicked!= null ? Text('Date selected: ${datePicked.day}-${datePicked.month}-${datePicked.year}', textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).shadowColor,
                                fontWeight: FontWeight.bold,
                              )) : Text('${date.day}-${date.month}-${date.year}', textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).shadowColor,
                                fontWeight: FontWeight.bold,
                              ))*/

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('at',  textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).shadowColor,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () async{
                              selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),// Use the existing datePicked if available
                                // Updated last date
                              );

                              setState(() {});

                            },
                            child: Text(selectedTime != null ? '${selectedTime?.hour.toString().padLeft(2,'0')} : ${selectedTime?.minute.toString().padLeft(2, '0')}' : 'TIME',
                                textAlign: TextAlign.center, style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).shadowColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          Container(
                            width: 150,
                            child: TextField(
                                controller: titlecontroller,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).shadowColor,
                                  fontWeight: FontWeight.bold,),
                                decoration: InputDecoration(
                                  hintText: 'Add note',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 1),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 1),
                                  ),
                                )),
                          ),

                          /*Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                width: 100,
                                child: TextField(
                                    controller: desccontroller,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).shadowColor,
                                      fontWeight: FontWeight.bold,),
                                    decoration: InputDecoration(
                                      hintText: 'desc',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).shadowColor, width: 1),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).shadowColor, width: 1),
                                      ),
                                    )),
                              ),
                            ),*/






                        ]
                    ),
                  )
              )),

          Expanded(
              flex: 1,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container (
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      dropdownColor: Theme.of(context).shadowColor,
                                      value: defaultDropDownValue,
                                      items: arrTransType
                                          .map((value) => DropdownMenuItem(
                                        child: Text(value, textAlign: TextAlign.center, style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context).canvasColor,
                                          fontWeight: FontWeight.bold,
                                        )),

                                        value: value,

                                      )).toList(),
                                      onChanged: (dynamic selectedValue){
                                        defaultDropDownValue = selectedValue;
                                        setState((){

                                        });
                                      }),
                                ],
                              )
                          ),

                          Text ('-->'),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: BlocListener<ExpenseTypeBloc, ExpenseTypeState>(
                              listener: (context, state) {

                                if (state is ExpenseTypeLoadedState) {
                                  arrExpenseType = state.arrExpenseType;
                                  setState(() {});
                                }
                              },
                              child: TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(21),
                                                topRight: Radius.circular(21))),
                                        builder: (context) {
                                          return GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: arrExpenseType.length,
                                              gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 100),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        _selectedIndex = index;
                                                        setState(() {});
                                                      },
                                                      child:  Container(
                                                          width: 40,
                                                          height: 40,
                                                          child: Image.asset(arrExpenseType[index].imgPath ?? '')),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(arrExpenseType[index].name ?? '',
                                                        style: mTextStyleThin(mfontSize: 12 ,
                                                            mColor: Theme.of(context).backgroundColor)),
                                                  ],
                                                );
                                              });
                                        });
                                  },


                                  child: _selectedIndex == -1 ?

                                  Row(
                                    children: [
                                      Text("Unselected", textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text ('(--)', textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ) : Row(
                                    children: [
                                      Text(arrExpenseType[_selectedIndex].name  ?? '', textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: 18,
                                          height: 18,
                                          child: Image.asset(arrExpenseType[_selectedIndex].imgPath ?? '')),
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
                                    fontSize: 12,
                                    color: Theme.of(context).canvasColor,
                                    fontWeight: FontWeight.bold,
                                  ))
                              ),
                            ),
                          )





                        ],
                      )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                    ),
                  ),
                ],
              )),

          Expanded(
            flex: 4,
            child: buildNumberPad(),
          ),

        ],

      );
  }


  Widget LandscapeUI () {
    return Row (
      children: [

        Expanded(
          flex: 1,
          child: Column(
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

            ),
              ),

            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
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
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Container (
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Row(
                        children: [
                          TextButton(
                              onPressed: () async {
                                datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: datePicked ?? DateTime.now(), // Use the existing datePicked if available
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2023, 12, 31), // Updated last date
                                );

                                setState(() {});
                              },
                              child: Text(datePicked != null ? '${datePicked?.day.toString().padLeft(2,'0')}-${datePicked?.month.toString().padLeft(2, '0')}-${datePicked?.year}': 'DATE',
                                  textAlign: TextAlign.center, style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).shadowColor,
                                    fontWeight: FontWeight.bold,
                                  ))

                            /*datePicked!= null ? Text('Date selected: ${datePicked.day}-${datePicked.month}-${datePicked.year}', textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).shadowColor,
                              fontWeight: FontWeight.bold,
                            )) : Text('${date.day}-${date.month}-${date.year}', textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).shadowColor,
                              fontWeight: FontWeight.bold,
                            ))*/

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('at',  textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).shadowColor,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () async{
                              selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),// Use the existing datePicked if available
                                // Updated last date
                              );

                              setState(() {});

                            },
                            child: Text(selectedTime != null ? '${selectedTime?.hour.toString().padLeft(2,'0')} : ${selectedTime?.minute.toString().padLeft(2, '0')}' : 'TIME',
                                textAlign: TextAlign.center, style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).shadowColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          Container(
                            width: 150,
                            child: TextField(
                                controller: titlecontroller,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).shadowColor,
                                  fontWeight: FontWeight.bold,),
                                decoration: InputDecoration(
                                  hintText: 'Add note',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 1),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 1),
                                  ),
                                )),
                          ),

                          /*Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              width: 100,
                              child: TextField(
                                  controller: desccontroller,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).shadowColor,
                                    fontWeight: FontWeight.bold,),
                                  decoration: InputDecoration(
                                    hintText: 'desc',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).shadowColor, width: 1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).shadowColor, width: 1),
                                    ),
                                  )),
                            ),
                          ),*/

                        ]
                    ),
                  )
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container (
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      dropdownColor: Theme.of(context).shadowColor,
                                      value: defaultDropDownValue,
                                      items: arrTransType
                                          .map((value) => DropdownMenuItem(
                                        child: Text(value, textAlign: TextAlign.center, style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context).canvasColor,
                                          fontWeight: FontWeight.bold,
                                        )),

                                        value: value,

                                      )).toList(),
                                      onChanged: (dynamic selectedValue){
                                        defaultDropDownValue = selectedValue;
                                        setState((){

                                        });
                                      }),
                                ],
                              )
                          ),

                          Text ('-->'),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: BlocListener<ExpenseTypeBloc, ExpenseTypeState>(
                              listener: (context, state) {

                                if (state is ExpenseTypeLoadedState) {
                                  arrExpenseType = state.arrExpenseType;
                                  setState(() {});
                                }
                              },
                              child: TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(21),
                                                topRight: Radius.circular(21))),
                                        builder: (context) {
                                          return GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: arrExpenseType.length,
                                              gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 100),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        _selectedIndex = index;
                                                        setState(() {});
                                                      },
                                                      child:  Container(
                                                          width: 40,
                                                          height: 40,
                                                          child: Image.asset(arrExpenseType[index].imgPath ?? '')),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(arrExpenseType[index].name ?? '',
                                                        style: mTextStyleThin(mfontSize: 12 ,
                                                            mColor: Theme.of(context).backgroundColor)),
                                                  ],
                                                );
                                              });
                                        });
                                  },


                                  child: _selectedIndex == -1 ?

                                  Row(
                                    children: [
                                      Text("Unselected", textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text ('(--)', textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ) : Row(
                                    children: [
                                      Text(arrExpenseType[_selectedIndex].name  ?? '', textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: 18,
                                          height: 18,
                                          child: Image.asset(arrExpenseType[_selectedIndex].imgPath ?? '')),
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
                                    fontSize: 12,
                                    color: Theme.of(context).canvasColor,
                                    fontWeight: FontWeight.bold,
                                  ))
                              ),
                            ),
                          )





                        ],
                      )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),

            ]
          ),
        ),


        Expanded (
          flex: 1,
          child:buildNumberPad(),
        ),

      ],
    );
  }




}

class KeyboardNumber extends StatelessWidget {
 final int n;
 final Function() onPressed;

  KeyboardNumber({required this.n, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
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
