// To parse this JSON data, do
//
//     final eMail = eMailFromJson(jsonString);

import 'dart:convert';

EMail eMailFromJson(String str) => EMail.fromJson(json.decode(str));
String eMailToJson(EMail data) => json.encode(data.toJson());

class EMail {
  EMail({
   required this.id,
  required  this.email,
  });

  String id;
  String email;

  factory EMail.fromJson(Map<String, dynamic> json) => EMail(
    id: json["id"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
  };
}
