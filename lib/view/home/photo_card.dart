import 'package:flutter/material.dart';

import '../../model/photo_model.dart';

Widget photoCard(PhotoModel photoModel) {
  debugPrint(photoModel.url);
  return Padding(
    padding: const EdgeInsets.only(right: 50, left: 50, bottom: 20, top: 20),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              width: 80,
          //    child: Image.network(photoModel.thumbnailUrl, fit: BoxFit.cover),
              child: Image.asset("lib/assets/150x150.png", fit: BoxFit.cover),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Text(photoModel.title, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}