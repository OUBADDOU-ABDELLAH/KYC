// To parse this JSON data, do
//
//     final nomPrenom = nomPrenomFromJson(jsonString);

import 'dart:convert';

NomPrenom nomPrenomFromJson(String str) => NomPrenom.fromJson(json.decode(str));

String nomPrenomToJson(NomPrenom data) => json.encode(data.toJson());

class NomPrenom {
  NomPrenom({
   required this.id,
    required this.prenom,
    required this.nom,
  });

  String id;
  String prenom;
  String nom;

  factory NomPrenom.fromJson(Map<String, dynamic> json) => NomPrenom(
    id: json["id"],
    prenom: json["prenom"],
    nom: json["nom"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prenom": prenom,
    "nom": nom,
  };
}
