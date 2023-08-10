import 'package:expentappbysir/screens/home/frags/frag_transaction/add_expenses.dart';
import 'package:expentappbysir/ui/custom_widgets/custom_roundedbutton.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../ui/ui_helper.dart';

class fragTransactionScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: MediaQuery.of(context).orientation == Orientation.portrait ? portraiteUI (context) : landscapeUI (context),

      ),
    );
  }

  Widget portraiteUI (BuildContext context) {

    return Column (
        children:[
          Expanded(
              flex: 1,
              child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => addExpenses()),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).canvasColor,
                          child: Icon(
                              Icons.add,
                              size: 15,
                              color: Theme.of(context).backgroundColor),
                        ),
                      ),
                    ),
                  )
              )
          ),
          Expanded(
              flex: 7,
              child: Container(
                  width: double.infinity,
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('Spent this week', style: mTextStyleThin(mfontSize: 12, mColor:Theme.of(context).shadowColor)),
                        RichText(text: TextSpan(
                            children: [
                             /* TextSpan(
                                  text: '\$', style: mTextStyleThin(mfontSize: 15, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                              ),*/
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0.0, -15),
                                  child: Text(
                                    '\$',
                                    style: mTextStyleThin(mfontSize: 15, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text: '292', style: mTextStyleForTrans(mfontSize: 43, mfontWeight: FontWeight.w900, mColor:Theme.of(context).canvasColor)
                              ),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0.0, -15),
                                  child: Text(
                                    '.50',
                                    style: mTextStyleThin(mfontSize: 15, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                                  ),
                                ),
                              ),

                              /*TextSpan(
                                  text: '.50', style: mTextStyleForTrans(mfontSize: 19, mfontWeight: FontWeight.w900, mColor:Theme.of(context).canvasColor)
                              ),*/

                            ]
                        ))
                      ]
                  )
              )
          ),
          Expanded(
              flex: 11,
              child: ListView.builder(
                  itemCount: Constants.arrTransaction.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index)=> dayWiseTransactionItem(context, Constants.arrTransaction[index] ))
          ),
        ]
    );

  }

  Widget landscapeUI (BuildContext context) {
    return Row (
      children: [
        Expanded(
          flex: 4,
          child:  MediaQuery.of(context).size.height> 350 ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
                  color: Theme.of(context).backgroundColor,
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('Spent this week', style: mTextStyleThin(mfontSize: 15, mColor:Theme.of(context).shadowColor)),
                        RichText(text: TextSpan(
                            children: [
                              /*TextSpan(
                                  text: '\$', style: mTextStyleThin(mfontSize: 22, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor)
                              ),*/
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0.0, -15),
                                  child: Text(
                                    '\$',
                                    style: mTextStyleThin(mfontSize: 22, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text: '292', style: mTextStyleForTrans(mfontSize: 53, mfontWeight: FontWeight.w900, mColor:Theme.of(context).canvasColor)
                              ),

                             /* TextSpan(
                                  text: '.50', style: mTextStyleForTrans(mfontSize: 26, mfontWeight: FontWeight.w900, mColor:Theme.of(context).canvasColor)
                              ),*/

                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0.0, -15),
                                  child: Text(
                                    '.50',
                                    style: mTextStyleThin(mfontSize: 26, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                                  ),
                                ),
                              ),

                            ]
                        ))
                      ]
                  )
              ),
              SizedBox(
                height: 21,
              ),
              SizedBox(
                width: 130,
                height: 40,
                child: customRoundedButton(callback: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addExpenses()),
                  );

                }, text: "A", mchild: Row (
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:1,
                      child: CircleAvatar(
                          backgroundColor: Theme.of(context).backgroundColor,
                          child: Icon (Icons.add, color: Theme.of(context).canvasColor)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 3,
                        child: Text ('Add Expense', style: mTextStyleBold(mfontSize: 12, mColor:Theme.of(context).backgroundColor) ))
                  ]
                ),),
              )

            ]
          ) : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('Spent this week', style: mTextStyleThin(mfontSize: 10, mColor:Theme.of(context).shadowColor)),
                              RichText(text: TextSpan(
                                  children: [
                                  /*  TextSpan(
                                        text: '\$', style: mTextStyleThin(mfontSize: 13, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor)
                                    ),*/
                                    WidgetSpan(
                                      child: Transform.translate(
                                        offset: const Offset(0.0, -8),
                                        child: Text(
                                          '\$',
                                          style: mTextStyleThin(mfontSize: 13, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: '292', style: mTextStyleForTrans(mfontSize: 25, mfontWeight: FontWeight.w900, mColor:Theme.of(context).canvasColor)
                                    ),

                                    WidgetSpan(
                                      child: Transform.translate(
                                        offset: const Offset(0.0, -8),
                                        child: Text(
                                          '.50',
                                          style: mTextStyleThin(mfontSize: 13, mfontWeight: FontWeight.bold, mColor:Theme.of(context).shadowColor),
                                        ),
                                      ),
                                    ),
                                   /* TextSpan(
                                        text: '.50', style: mTextStyleForTrans(mfontSize: 18, mfontWeight: FontWeight.w900, mColor:Theme.of(context).canvasColor)
                                    ),*/

                                  ]
                              ))
                            ]
                        )
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      width: 90,
                      height: 30,
                      child: customRoundedButton(callback: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addExpenses()),
                        );

                      }, text: "A", mchild: Row (
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex:1,
                              child: CircleAvatar(
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  child: Icon (Icons.add, size: 10, color: Theme.of(context).canvasColor)),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Expanded(
                                flex: 3,
                                child: Text ('Add Expense', style: mTextStyleBold(mfontSize: 7, mColor:Theme.of(context).backgroundColor) ))
                          ]
                      ),),
                    )

                  ]
              ),
            ),
          )
        ),


        Expanded(
          flex: 4,
          child: ListView.builder(
                    itemCount: Constants.arrTransaction.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index)=> dayWiseTransactionItem(context, Constants.arrTransaction[index] )),

        ),

      ]
    );

  }


  Widget dayWiseTransactionItem(BuildContext context, Map dayWiseTransDetails) {
    return Column (
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 75, right: 15, bottom: 10),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dayWiseTransDetails['day'], style: mTextStyleThin(mfontSize: 11, mColor: Theme.of(context).canvasColor)),
              Text('\$ ${dayWiseTransDetails['amt']}', style: mTextStyleThin(mfontSize: 11, mColor: Theme.of(context).canvasColor)),
              ]
          ),
        ),
            Padding(
              padding: const EdgeInsets.only(left: 75, right: 15,),
              child: Container(
                height: 0.5,
                color: Colors.black12,
              ),
            ),
            ListView.builder(
              itemCount: dayWiseTransDetails['transactions'].length,
                shrinkWrap: true,
                itemBuilder: (context, index)=> detailTransactionItem(context,dayWiseTransDetails ['transactions'] [index] ))
      ]
    );

  }

  Widget detailTransactionItem(BuildContext context, Map detailedTrans) {
    return ListTile(
      leading: Image.asset(detailedTrans['image']),
      title: Text (detailedTrans['title'], style: mTextStyleBold(mfontSize: 12, mColor: Theme.of(context).canvasColor )),
      subtitle: Text (detailedTrans['desc'], style: mTextStyleThin(mfontSize: 12, mColor:Theme.of(context).shadowColor)),
      trailing: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('\$ ${detailedTrans['amount']}', style: mTextStyleBold(mfontSize: 12, mColor: Theme.of(context).canvasColor )),
          Text('\$ ${detailedTrans['balance']}', style: mTextStyleThin(mfontSize: 12, mColor: Theme.of(context).shadowColor)),
        ],
      ),
    );
  }
}



