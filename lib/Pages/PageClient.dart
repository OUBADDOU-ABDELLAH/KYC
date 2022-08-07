import 'package:cih/API/ApiClient.dart';
import 'package:cih/GlobalParametres/functionsProject/SuivantPrecedent.dart';
import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/Pages/PageEmail.dart';
import 'package:cih/Pages/PageTelephone.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../API/Countries.dart';
/*
Future<ApiClient> submitData(String prenom,String nom) async{
  var response = await http.post(Uri.parse('https://reqres.in/api/users'),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "prenom":prenom,"nom":nom
      }));
  print(response.body);
  if(response.statusCode==201){
   // CircularProgressIndicator();
    String responseString =response.body ;
    apiClientFromJson(responseString ) ;
    return ApiClient.fromJson(json.decode(response.body)) ;
  }
  else{
    throw Exception('Failed to create.') ;
  }
  // else{return null ;}
}
*/

class PageClient extends StatefulWidget {
  //PageClient({required this.NOM, required this.PRENOM});
  @override
  State<PageClient> createState() => _PageClientState();
}

//TODO lorsque on appuye sur précedent le button suivant doit etre activer si le champs n'est pas vide
class _PageClientState extends State<PageClient> {
  String? value;
  String? pays;
  TextEditingController controll = TextEditingController();
  Clients client = new Clients("", "", "", "");
  final _formKey = GlobalKey<FormState>();
  bool PRENOM_BOOL = false;
  bool NOM_BOOL = false;
  bool isVerified=false;
  SuivantPrecedent SP = SuivantPrecedent();
  Countries country = Countries();
  String? selectedItem = "Morocco";
  List<Map>? _AllCountries;
  _PageClientState() {
    _AllCountries = country.AllCountries;
   // TextEditingController _textEditingController = TextEditingController();
  }
  // Future<ApiClient>? _dataClient ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final isDisable=client.getPrenom().toString().isEmpty ;
  }

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

          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Bonjour!',
                    style: TextStyle(
                        color: Color.fromRGBO(248, 90, 1, 1),
                        fontSize: 26,
                        fontFamily: 'ArvoBold',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Et si nous faisons connaissance',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Avenir,Book',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(

                      key: _formKey,
                      onChanged: () {
                        setState(() {
                          isVerified = _formKey.currentState!.validate();
                        });
                      },
                      child: Column(
                        children: [
                          TextFormField(
                           // initialValue: client.getPrenom(),
                            decoration: InputDecoration(
                              hintText: 'Prénom',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Alfa'
                            ),
                            onChanged: (value) {
                              client.setPrenom(value);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              } else
                                null;
                            },
                          ),
                          TextFormField(
                           // initialValue: client.getNom(),
                            controller: controll,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Alfa'
                            ),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.grey,
                                backgroundColor: Colors.grey,
                              ),
                              hintText: 'Nom',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onChanged: (value) {
                              client.setNom(value);
                              setState((){
                              NOM_BOOL=  controll.text.isNotEmpty;
                              });
                            },
                            // controller: ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              } else
                                null;
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: 'Pays de résidence',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          hintText: 'pays'),
                      value: selectedItem,
                      items: _AllCountries?.map(
                        (Map item) => DropdownMenuItem<String>(
                          value: item['name'],
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                    fontSize: 19,
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'avenir',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).toList(),
                      onChanged: (item) => setState(() => selectedItem = item),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            children: [
              /* SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    CircularProgressIndicator();
                    Navigator.pushNamed(context, '/ouvrirCompte');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Précédent',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(248, 90, 1, 1),
                      fontFamily: 'LatoBold',
                    ),
                  ),
                ),
              ),*/
           SP.Precedent('/ouvrirCompte', context),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: (isVerified)
                      ? () {
                          setState(() {
                            isVerified = !isVerified;

                            if (selectedItem != 'Morocco') {
                              Navigator.pushNamed(context, '/globalization');
                            } else {
                              Navigator.pushNamed(context, '/email');
                            }
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(248, 90, 1, 1),
                    onSurface: Color.fromRGBO(248, 90, 1, 1),
                  ),
                  child: Text(
                    'Suivant',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'LatoBold'),
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
