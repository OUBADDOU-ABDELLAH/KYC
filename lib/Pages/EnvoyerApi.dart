import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:flutter/material.dart';
class Envoyer extends StatefulWidget {

  @override
  State<Envoyer> createState() => _EnvoyerState();
}

class _EnvoyerState extends State<Envoyer> {
  Clients client =new Clients("", "", "", "") ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("send data"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text('Prenom : '+client.getPrenom().toString()),
              Text('nom : '+client.getNom().toString()),
              Text('email : '+client.getEmail().toString()),
              Text('tel : '+client.getTel().toString()),
              Text('password : '+client.getPass().toString()),

            ],
          ),
        ),
      ),
    );
  }
}
