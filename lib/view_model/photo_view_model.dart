import 'package:flutter/cupertino.dart';
import 'package:vartur_assignment/repo/api_status.dart';

import '../model/photo_error_model.dart';
import '../model/photo_model.dart';
import '../repo/photo_repo.dart';

class PhotoViewModel extends ChangeNotifier {

  List<PhotoModel> _photoList = [];
  bool _isLoading = false;
  PhotoError? _photoError;
  int _selectedIndex = 0;

  bool get isLoading => _isLoading;
  List<PhotoModel> get photoList => _photoList;
  PhotoError? get photoError => _photoError;
  int get selectedIndex => _selectedIndex;

  PhotoViewModel() {
    getPhotos();
  }

  setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setPhotoModel(List<PhotoModel> photoModel) {
    _photoList = photoModel;
  }

  setPhotoError(PhotoError photoError) {
    _photoError = photoError;
  }

  getPhotos() async {
    setLoading(true);
    var response = await PhotoRepository.getUsers();
    if(response is Success) {
      setPhotoModel(response.response as List<PhotoModel>);
    }
    if(response is Failure) {
      PhotoError photoError = PhotoError(
        code: response.code,
        message: response.errorResponse.toString()
      );
      setPhotoError(photoError);
    }
    setLoading(false);
  }
}