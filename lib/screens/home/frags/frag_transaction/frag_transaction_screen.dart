import 'package:flutter/material.dart';

class fragTransactionScreen extends StatelessWidget {
  const fragTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column (
          children:[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.pinkAccent
              )
            ),
            Expanded(
                flex: 7,
                child: Container(
                    color: Colors.greenAccent,
                )
            ),
            Expanded(
                flex: 11,
                child: ListView.builder(
                  itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index)=> dayWiseTransactionItem())
            ),

          ]
        )
    );
  }

  Widget dayWiseTransactionItem() {
    return Column (
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: (TextStyle(fontSize: 12, color: Colors.green))),
              Text('\$ 7.24', style: (TextStyle(fontSize: 12, color: Colors.green))),
              ]
          ),
        ),
            ListView.builder(
              itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index)=> ListTile(
              leading: Image.asset('assets/images/drugs.png'),
              title: Text ('Watched Movie'),
              subtitle: Text ('with friends'),
              trailing: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$3.35'),
                  Text('\$231.45'),
                ],
              ),
            ))
      ]
    );

  }

}
