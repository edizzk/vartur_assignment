import 'package:flutter/material.dart';

import '../widget/bottom_nav_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.selectedIndex}) : super(key: key);

  final String title = "Search Screen";
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
