import 'package:flutter/material.dart';
import 'package:vartur_assignment/model/photo_model.dart';
import 'package:vartur_assignment/view/my_account_view.dart';
import 'package:vartur_assignment/view/search_view.dart';

import '../view/home/home_view.dart';
import '../view/photo_detail_view.dart';

void openDetailsView(BuildContext context, PhotoModel photoModel) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhotoDetailView(photoModel: photoModel))
  );
}
void openVarturView(BuildContext context, int selectedIndex) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: "Vartur Assignment", selectedIndex: selectedIndex))
  );
}

void openSearchView(BuildContext context, int selectedIndex) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SearchView(selectedIndex: selectedIndex))
  );
}

void openMyAccountView(BuildContext context, int selectedIndex) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyAccountView(selectedIndex: selectedIndex))
  );
}