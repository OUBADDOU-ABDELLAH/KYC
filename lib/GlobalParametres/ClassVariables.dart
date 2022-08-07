import 'package:flutter/material.dart';

 class Clients {
 static String? Prenom;
 static String? Nom;
 static String? Tel;
 static String? Email;
 static String? MotPass;
  //Clients();
  Clients(Prenom, Nom, Email, Tel);
  //Clients(this.Prenom) ;
  //Clients.empty(){}
 setPrenom(String p) {
  Prenom= p;
 }
  String? getPrenom() {
    return  Prenom ;
  }

 setPass(String keyWord) {
  MotPass= keyWord;
 }
 String? getPass() {
  return  MotPass ;
 }

 setNom(String n) {
  Nom= n;
 }
  String? getNom() {
    return Nom ;
  }

 setEmail(String e) {
  Email= e;
 }
 String? getEmail() {
  return Email ;
 }

 setTel(String t) {
  Tel= t;
 }
 String? getTel() {
  return Tel ;
 }
 Future openDialog(context)=>showDialog(
  context: context,
  builder: (context)=>AlertDialog(
   title: Image(image: AssetImage('images/logo.jpg')),
   content:Text('Besoin d\'aide') ,

  ),
 ) ;

}


