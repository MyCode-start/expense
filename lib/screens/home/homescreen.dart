

import 'package:expentappbysir/screens/home/frags/frag_stats/frag_transaction_stats_screen.dart';
import 'package:expentappbysir/screens/home/frags/frag_transaction/frag_transaction_screen.dart';
import 'package:flutter/material.dart';

import '../../ui/ui_helper.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  var selectedIndex= 0;
  var arrFrags = [
    fragTransactionScreen(),
    fragTransactionStats(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Theme.of(context).backgroundColor,
        body: arrFrags[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: selectedIndex,
          selectedIconTheme: IconThemeData (
            size: 22
          ),
          unselectedIconTheme: IconThemeData (
              size: 16
          ),
          onTap: (index) {
          selectedIndex= index;
          setState(() {});
          },
          backgroundColor: Theme.of(context).brightness==Brightness.light ?
          MyColor.secondaryWColor : MyColor.secondaryBColor,
          items: [
          BottomNavigationBarItem(


              icon: Icon(Icons.inbox_outlined,
            color: Theme.of(context).brightness==Brightness.light ?
          MyColor.secondaryBColor : MyColor.secondaryWColor, ),
              label: '',

            activeIcon: Icon(Icons.inbox_rounded,  color: Theme.of(context).brightness==Brightness.light ?
            MyColor.bgBColor : MyColor.bgWColor, ),

              tooltip: 'Expense'

          ),



          BottomNavigationBarItem(icon: Icon(Icons.auto_graph,  color: Theme.of(context).brightness==Brightness.light ?
          MyColor.secondaryBColor : MyColor.secondaryWColor, ), label: '',
              activeIcon: Icon(Icons.auto_graph_outlined, color: Theme.of(context).brightness==Brightness.light ?
              MyColor.bgBColor : MyColor.bgWColor, ), tooltip: 'Report'),



          /*BottomNavigationBarItem(icon: Icon(Icons.settings,
            color: Theme.of(context).brightness==Brightness.light ?
           MyColor.secondaryBColor : MyColor.secondaryWColor, ), label: '',
            activeIcon: Icon(Icons.settings_applications_rounded, color: Theme.of(context).brightness==Brightness.light ?
            MyColor.bgBColor : MyColor.bgWColor, ), tooltip: 'Setting'),*/
        ]
      ),

    );
  }
}
