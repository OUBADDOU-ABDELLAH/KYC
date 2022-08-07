import 'package:cih/DrawerPages/PageChoisirLangue.dart';
import 'package:cih/Pages/MotDePasse.dart';
import 'package:cih/Pages/OuvrirCompte.dart';
import 'package:cih/Pages/PageClient.dart';
import 'package:cih/Pages/PageEmail.dart';
import 'package:cih/Pages/PageOk.dart';
import 'package:cih/Pages/PageTelephone.dart';
import 'package:cih/Pages/VerificationAdresseMail.dart';
import 'package:cih/Pages/VerificationSmsOtp.dart';
import 'package:cih/Pages/VerifierEmailOtp.dart';
import 'package:flutter/material.dart';
import 'Pages/EnvoyerApi.dart';
import 'Pages/MyHome.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        //primarySwatch: Colors.blue,
        //primarySwatch: Color.fromRGBO(248, 91, 1, 1),

      ),
      routes: {
        "/client":(context)=>PageClient() ,//NOM: "hh",PRENOM: "oo"
        "/ouvrirCompte":(context)=>OuvrirCompte(),
        "/myHome":(context)=>MyHome(),
        "/choisirLangue":(context)=>ChoisirLangue(),
        "/email":(context)=>Email(),
        "/telephone":(context)=>Telephone(),
        "/envoyer":(context)=> Envoyer(),
        "/passWord":(context)=>PassWord(),
        "verifierMail":(context)=>VerificationMail() ,
        "/globalization":(context)=>Globalization() ,
        "/verifierEmailOtp":(context)=>VerifierEmailOtp() ,
        "/verifierSmsOtp":(context)=>VerificationSms() ,
      },

      initialRoute: "/myHome",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}