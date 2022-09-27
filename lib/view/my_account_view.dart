import 'package:flutter/material.dart';

import '../widget/bottom_nav_bar.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({Key? key, required this.selectedIndex}) : super(key: key);

  final String title = "My Account Screen";
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title), centerTitle: true),
      bottomNavigationBar: bottomNavBar(context, selectedIndex),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
