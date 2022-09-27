import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../model/photo_model.dart';
import '../../view/home/photo_card.dart';
import '../../view_model/photo_view_model.dart';
import '../../widget/app_loading.dart';
import '../../widget/failure_box.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String bottomNav1 = "Vartur";
  final String bottomNav2 = "Search";
  final String bottomNav3 = "My Account";

  @override
  Widget build(BuildContext context) {
    PhotoViewModel photoViewModel = context.watch<PhotoViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: _ui(photoViewModel),
      bottomNavigationBar: GNav(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        tabBackgroundColor: Colors.grey.shade300,
        gap: 10,
        padding: const EdgeInsets.all(20),
        onTabChange: (index) {},
        tabs: [
          GButton(icon: Icons.home, text: bottomNav1),
          GButton(icon: Icons.search, text: bottomNav2),
          GButton(icon: Icons.person, text: bottomNav3)
        ],
      ),
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
        return photoCard(photoModel);
      },
      separatorBuilder: (context, index) =>
          const Divider(thickness: 1, color: Colors.black54),
      itemCount: photoViewModel.photoList.length,
    );
  }
}
