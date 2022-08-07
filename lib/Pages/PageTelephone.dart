import 'package:cih/API/Countries.dart';
import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/GlobalParametres/Operateur.dart';
import 'package:cih/GlobalParametres/functionsProject/SuivantPrecedent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:select_form_field/select_form_field.dart';
//import 'package:http/http.dart';

class Telephone extends StatefulWidget {
  const Telephone({Key? key}) : super(key: key);

  @override
  State<Telephone> createState() => _TelephoneState();
}

class _TelephoneState extends State<Telephone> {
  final _formKey = GlobalKey<FormState>();
SuivantPrecedent SP =SuivantPrecedent();
  String? _selected;
  String? _selectedItem='+212';
  bool BOOL_OPERATEUR = false;
  bool BOOL_TEL = false;

  Operateurs operateur = Operateurs();
  Countries countries=Countries() ;
List<Map>? _MyCountry=null ;
  List<Map>? _myJson = null;

  bool isValide=false;
  _TelephoneState() {
    _myJson = operateur.myJson;
    _MyCountry=countries.AllCountries ;
  }

  Clients client = Clients("", "", "", "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          // backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          //reverse: false,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Bonjour,' + client.getPrenom().toString() + '!',
                  style: TextStyle(
                      color: Color.fromRGBO(248, 90, 1, 1),
                      fontSize: 22,
                      fontFamily: 'ArvoBold'),
                ),
                Text(
                  'Pour initier votre demande d\'ouverture de compte, '
                  'veuillez saisir votre numéro de téléphone mobile',
                  style: TextStyle(fontSize: 16,
                  fontFamily: 'Avenir'
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
Form(
  onChanged: (){
    setState((){
      isValide=_formKey.currentState!.validate() ;
    }) ;
  },
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        SizedBox(
          width: 90,
          child: Center(
            child: DropdownButtonFormField<String>(
              // isDense: false ,

              decoration: new InputDecoration(
                // border: InputBorder.none,
                filled: true,
                alignLabelWithHint: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
              ),
              //value: selectedItem,
              //hint: '',
              value: _selectedItem,
              items: _MyCountry?.map(
                    (Map item) => DropdownMenuItem<String>(
                  value: item['dial_code'],
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/flags/flag_'+item['code'].toString().toLowerCase()+'.png'),
                        width: 25,
                        height: 25,
                      ),

                      Text(
                        item['dial_code'],
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'avenir',
                        ),
                      ),
                    ],
                  ),
                ),
              ).toList(),
              onChanged: (item) => setState(() => _selectedItem = item),
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),

        SizedBox(
          width: 270,
          child: TextFormField(
            validator: (value){
              if( value==null || value.isEmpty ){
                return'';
              }
            },
            decoration: InputDecoration(
              hintText: 'Numéro de téléphone',
              hintStyle: TextStyle(
                fontFamily: 'Alfa',
              ),
            ),
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Alfa',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly ,
            ],
          ),
        )
      ],
    ),

    DropdownButtonFormField<String>(
      validator: (_selected){
        if(_selected!.isEmpty){
          return '' ;
        }
      },
      // isDense: false ,
      decoration: InputDecoration(
        hintText: 'Operateur',
      ),
      //value: selectedItem,
      // hint: "Operateur",
      value: _selected,
      items: _myJson?.map(
            (Map item) => DropdownMenuItem<String>(

          value: item['name'],
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),

              Image.asset(
                item["image"],
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                item['name'],
                style: TextStyle(
                  fontSize: 17,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'avenir',
                ),
              ),

            ],
          ),
        ),
      ).toList(),
      onChanged: (item) => setState(() => _selected = item),
    ),

  ],
)),



              ],
            ),
          )),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SP.Precedent('/email', context),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 190,
                height: 50,
                child: ElevatedButton(
                  onPressed:

                  isValide ?(){
                    CircularProgressIndicator();
                    Navigator.pushNamed(context, '/passWord') ;
                    setState((){
                      isValide=false ;

                    });
                  }:
                      null ,
                  /*(){
                    Navigator.pushNamed(context, '/passWord') ;

                  } ,*/
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

/*import 'package:cih/API/ApiClient.dart';
import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/Pages/EnvoyerApi.dart';
import 'package:cih/Pages/PageEmail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../GlobalParametres/Operateur.dart';
import 'package:select_form_field/select_form_field.dart';

/*
Future<ApiClient> EnvoyerTel(String tel) async{
  var response = await http.post(Uri.parse('https://reqres.in/api/users'),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "telephone":tel,
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

class Telephone extends StatefulWidget {

 //Operateurs.instance.getList _items;
  //const Telephone({Key? key}) : super(key: key);


  @override
  State<Telephone> createState() => _TelephoneState();
}

class _TelephoneState extends State<Telephone> {
  Clients client=Clients("", "", "", "") ;
 // Operateurs op = Operateurs();
  //List<Map<String, dynamic>>? _items=null ;
 // _TelephoneState(){
   // _items = op.getList();
  }




 // TextEditingController telController=new TextEditingController();
  //Future<ApiClient>? _dataTel ;
 // String tel="" ;
  //String operateur ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage('images/transparent.jpg'),
                  fit: BoxFit.fill,
                  width: 180,
                  height: 90,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
               'Bonjour,'+client.getPrenom().toString()+'!',
                style: TextStyle(color: Colors.orange, fontSize: 27),
              ),
              Text(
                'Pour initier votre demande d\'ouverture de compte, '
                    'veuillez saisir votre numéro de téléphone mobile',
                style: TextStyle(fontSize: 16),
              ),


              SizedBox(
                height:20,
              ),

           /*   Row(
               children: [
                 SizedBox(
                   width: 100,
                   child: SelectFormField(
                     type: SelectFormFieldType.dropdown, // or can be dialog
                    // initialValue: 'circle',
                     // icon: Icon(Icons.format_shapes),
                     //labelText: 'A',
                    // items: ,
                     onChanged: (val) => print(val),
                     onSaved: (val) => print(val),
                   ),
                 ),
                 SizedBox(
                   width: 20,
                 ),
               SizedBox(
                   width: 250,
                   height: 70,
                   child: TextField(
                    /* onChanged: (value){
                       setState((){
                         client.setTel(value) ;
                       }
                       },*/

                     //onChanged: ,
                     decoration: new InputDecoration(labelText: "Enter your number"),
                     onChanged: ((value){
                       setState((){
                        // client.setTel(value) ;
                       });
                     }),
                     keyboardType: TextInputType.number,
                   )
               ),
               ],
              ),*/
              TextField(
                decoration: new InputDecoration(labelText: "Enter your number 1"),
                onChanged: ((value){
                  setState((){
                    // client.setTel(value) ;
                  });
                }),
              ),
              SizedBox(
                width: double.infinity,
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  //initialValue: 'circle',
                  // icon: Icon(Icons.format_shapes),
                  //labelText: 'A',
                  items: _items,
                  //onChanged: (val) => print(val),
                  hintText: 'Opérateur',
                  onChanged: (value){
                    setState((){
                     // this.operateur=value ;
                    });
                  },
                 // onSaved: (val) => print(val),
                ),
              ),
//Text('votr prenom mr : '+widget.prenom)
            ],
          ),
        ),
      ),

    );
  }
}
*/
