// To parse this JSON data, do
//
//     final customResponse = customResponseFromMap(jsonString);

import 'dart:convert';

CustomResponse customResponseFromMap(String str) =>
    CustomResponse.fromMap(json.decode(str));

String customResponseToMap(CustomResponse data) => json.encode(data.toMap());

class CustomResponse {
  CustomResponse({
    required this.code,
    required this.status,
    required this.id,
  });

  int code;
  String status;
  String id;

  factory CustomResponse.fromMap(Map<String, dynamic> json) => CustomResponse(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "id": id,
      };
}
