import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../service/navigator.dart';

Widget bottomNavBar(BuildContext context, int selectedIndex) {

  const String bottomNav1 = "Vartur";
  const String bottomNav2 = "Search";
  const String bottomNav3 = "My Account";

  void changeView(int index) {
    switch(index) {
      case 0 :
        return openVarturView(context, 0);
      case 1:
        return openSearchView(context, 1);
      case 2:
        return openMyAccountView(context, 2);
    }
  }

  return GNav(
    backgroundColor: Theme.of(context).bottomAppBarColor,
    tabBackgroundColor: Colors.grey.shade300,
    gap: 10,
    selectedIndex: selectedIndex,
    padding: const EdgeInsets.all(20),
    onTabChange: (index) => changeView(index),
    tabs: const [
      GButton(icon: Icons.home, text: bottomNav1),
      GButton(icon: Icons.search, text: bottomNav2),
      GButton(icon: Icons.person, text: bottomNav3)
    ],
  );


}
