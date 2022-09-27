import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/photo_model.dart';
import '../../view/home/photo_card.dart';
import '../../view_model/photo_view_model.dart';
import '../../widget/app_loading.dart';
import '../../widget/failure_box.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PhotoViewModel photoViewModel = context.watch<PhotoViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: _ui(photoViewModel),
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
        separatorBuilder: (context, index) => const Divider(thickness: 1, color: Colors.black54),
        itemCount: photoViewModel.photoList.length,
    );
  }
}
