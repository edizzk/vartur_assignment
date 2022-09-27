import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vartur_assignment/view_model/photo_view_model.dart';

Widget bottomNavBar(BuildContext context, PhotoViewModel photoViewModel) {

  const String bottomNav1 = "Vartur";
  const String bottomNav2 = "Search";
  const String bottomNav3 = "My Account";

  void changeView(int index) {
    photoViewModel.setSelectedIndex(index);
  }

  return GNav(
    backgroundColor: Theme.of(context).bottomAppBarColor,
    tabBackgroundColor: Colors.grey.shade300,
    gap: 10,
    selectedIndex: photoViewModel.selectedIndex,
    padding: const EdgeInsets.all(20),
    onTabChange: (index) => changeView(index),
    tabs: const [
      GButton(icon: Icons.home, text: bottomNav1),
      GButton(icon: Icons.search, text: bottomNav2),
      GButton(icon: Icons.person, text: bottomNav3)
    ],
  );


}
