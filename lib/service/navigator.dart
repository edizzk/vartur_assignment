import 'package:flutter/material.dart';
import 'package:vartur_assignment/model/photo_model.dart';

import '../view/photo_detail_view.dart';

void openDetailsView(BuildContext context, PhotoModel photoModel) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PhotoDetailView(photoModel: photoModel),
      )
  );
}