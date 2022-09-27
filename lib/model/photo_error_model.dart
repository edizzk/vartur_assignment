import 'dart:convert';

PhotoError photoErrorFromJson(String str) => PhotoError.fromJson(json.decode(str));

class PhotoError {
  PhotoError({
    this.code,
    this.message,
  });

  int? code;
  Object? message;

  factory PhotoError.fromJson(Map<String, dynamic> json) => PhotoError(
    code: json["code"],
    message: json["message"],
  );
}