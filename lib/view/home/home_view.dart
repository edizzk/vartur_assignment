import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/photo_model.dart';
import '../../view/home/photo_card.dart';
import '../../view_model/photo_view_model.dart';
import '../../widget/app_loading.dart';
import '../../widget/bottom_nav_bar.dart';
import '../../widget/failure_box.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  final String bottomNavText2 = "Search Screen";
  final String bottomNavText3 = "My Account Screen";

  @override
  Widget build(BuildContext context) {
    PhotoViewModel photoViewModel = context.watch<PhotoViewModel>();
    final tabs = [
      _ui(photoViewModel),
      Center(child: Text(bottomNavText2)),
      Center(child: Text(bottomNavText3)),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: tabs[photoViewModel.selectedIndex],
      bottomNavigationBar: bottomNavBar(context, photoViewModel),
    );
  }

  Widget _ui(PhotoViewModel photoViewModel) {
    if (photoViewModel.isLoading) {
      return const AppLoading();
    }
    if (photoViewModel.photoError?.code != null) {
      debugPrint("${photoViewModel.photoError?.message}");
      return FailureBox(text: photoViewModel.photoError?.message);
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        PhotoModel photoModel = photoViewModel.photoList[index];
        return photoCard(context, photoModel);
      },
      separatorBuilder: (context, index) =>
          const Divider(thickness: 1, color: Colors.black54),
      itemCount: photoViewModel.photoList.length,
    );
  }
}
