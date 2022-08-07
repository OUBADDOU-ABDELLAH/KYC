// To parse this JSON data, do
//
//     final apiClient = apiClientFromJson(jsonString);

import 'dart:convert';

ApiClient apiClientFromJson(String str) => ApiClient.fromJson(json.decode(str));

String apiClientToJson(ApiClient data) => json.encode(data.toJson());

class ApiClient {
  ApiClient({
   required this.id,
    required this.prenom,
    required this.nom,
    required this.email,
    required this.telephone,
  });

  String id;
  String prenom;
  String nom;
  String email;
  String telephone;

  factory ApiClient.fromJson(Map<String, dynamic> json) => ApiClient(
    id: json["id"],
    prenom: json["prenom"],
    nom: json["nom"],
    email: json["email"],
    telephone: json["telephone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prenom": prenom,
    "nom": nom,
    "email": email,
    "telephone": telephone,
  };
}
