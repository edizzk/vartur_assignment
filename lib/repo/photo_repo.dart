import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/photo_model.dart';
import '../utils/constants.dart';
import 'api_status.dart';

class PhotoRepository{
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(sampleUrl);
      var response = await http.get(url);
      if (response.statusCode == SUCCESS) {
        return Success(response: photoFromJson(response.body));
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}