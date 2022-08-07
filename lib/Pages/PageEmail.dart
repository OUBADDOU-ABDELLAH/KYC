import 'package:cih/API/ApiClient.dart';
import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/GlobalParametres/functionsProject/SuivantPrecedent.dart';
import 'package:cih/Pages/PageClient.dart';
import 'package:cih/Pages/PageTelephone.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:email_validator/email_validator.dart';

class Email extends StatefulWidget {
  // const Email({Key? key}) : super(key: key);
  //String prenom ;
  //String nom ;
  //Email(this.prenom,this.nom) ;

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  SuivantPrecedent SP=SuivantPrecedent() ;
  String _email = '';
 // bool EmailVide=false ;
  bool isEmailValide=false ;
  Clients client = Clients("", "", "", "");
  final _formKey = GlobalKey<FormState>();
  // TextEditingController emailController=new TextEditingController();
  // String prenom="";
  String email = "";
  //Future<ApiClient>? _dataEmail ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          // title: Text('App Bar!'),
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image(
              image: AssetImage('images/logo.jpg'),
              fit: BoxFit.fitHeight,
              //width: 50,
            ),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: ElevatedButton(
                onPressed: () {
                  client.openDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.headset_mic,
                      size: 27,
                      color: Color.fromRGBO(248, 91, 1, 1),
                    ),
                    Text(
                      'Besoin\n d\'aide',
                      style: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontSize: 11,
                          fontFamily: 'LatoBold'),
                    ),
                  ],
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Veuillez entrer votre adresse e-mail',
                  style: TextStyle(
                      color: Color.fromRGBO(248, 90, 1, 1),
                      fontSize: 22,
                      fontFamily: 'ArvoBold'),
                ),
                Text(
                  'Un e-mail de vérification vous sera envoyé.',
                  style: TextStyle(fontSize: 15, fontFamily: 'Avenir'),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  onChanged: (){
                    setState((){
                      isEmailValide=_formKey.currentState!.validate() ;
                     // isEmailValide=client.getEmail()!.isNotEmpty ;
                    }) ;

                  },
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          initialValue: client.getEmail(),
                          onChanged: (value) {

                            setState((){
                              client.setEmail(value);
                           //   EmailVide=client.getEmail()!.isNotEmpty;
                             // isEmailValide=true ;
                            });
                          },
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 19,
                            ),
                            hintText: 'Saisir un e-mail',
                          ),
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Alfa'
                          ),
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return '';
                            }

                          }),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            children: [
              SP.Precedent('/client', context),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed:( isEmailValide )
                      ? () {
                          CircularProgressIndicator();
                          setState(() {
                              isEmailValide = !isEmailValide;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Telephone()));

                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(248, 90, 1, 1),
                    onSurface: Color.fromRGBO(248, 90, 1, 1),
                  ),
                  child: Text(
                    'Suivant',
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
