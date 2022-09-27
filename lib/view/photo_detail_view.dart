import 'package:flutter/material.dart';
import 'package:vartur_assignment/model/photo_model.dart';

class PhotoDetailView extends StatelessWidget {
  const PhotoDetailView({Key? key, required this.photoModel}) : super(key: key);

  final PhotoModel photoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(10)
          ),
          child: _cardItems(),
        )
      ),
    );
  }

  Widget _cardItems() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        _imageBox(),
        const SizedBox(height: 75),
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Text(photoModel.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _imageBox() {
    return SizedBox(
      height: 240,
      width: 160,
      //    child: Image.network(photoModel.url, fit: BoxFit.cover),
      child: Image.asset("lib/assets/600x600.png", fit: BoxFit.cover),
    );
  }
}
