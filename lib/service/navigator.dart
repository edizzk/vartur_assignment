import 'package:flutter/material.dart';

import '../view/photo_detail_view.dart';

void openDetailsView(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PhotoDetailView(),
      )
  );
}