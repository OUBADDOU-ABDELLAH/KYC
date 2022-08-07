import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/Pages/EnvoyerApi.dart';
import 'package:cih/Pages/VerificationAdresseMail.dart';
import 'package:flutter/material.dart';

class PassWord extends StatefulWidget {
  const PassWord({Key? key}) : super(key: key);

  @override
  State<PassWord> createState() => _PassWordState();
}

class _PassWordState extends State<PassWord> {
  Clients client = Clients("", "", "", "");
  bool isValidate = false;
  bool isChecked = false;
  String _password = '';
  TextEditingController ControllerPassWord=TextEditingController() ;
  ClearAll(){
    ControllerPassWord.clear();
  }
  String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
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
          reverse: true,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Définissez un mot de passe',
                    style: TextStyle(
                        color: Color.fromRGBO(248, 90, 1, 1), fontSize: 27),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Votre mot de passe vous permettra de vous connecter a votre espace de suivi',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    onChanged: () {
                      setState((){
                        isValidate = _formKey.currentState!.validate();
                      });

                    },
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            _password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            if (value.length < 6) {
                              return '';
                            }
                            if (value != _password) {
                              return '';
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Mot de passe',
                            // hintStyle: TextStyle(color: Colors.grey,fontSize: 26),

                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: (() {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }),
                            ),
                          ),
                          obscureText: _obscureText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      /*  Text(
                            'le mot de passe doit contenir au moins 6 caractéres alphanumérique',
                            style: TextStyle(color: Colors.grey)),*/
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: ControllerPassWord,
                          onChanged: (valeur) {
                            client.setPass(valeur);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            if (value != _password) {
                              return '';
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Confirmer votre mot de passe',
                              hintStyle: TextStyle(color: Colors.grey),

                              suffixIcon:
                              isValidate
                                  ? Icon(Icons.verified,color: Colors.green,)
                                  : IconButton(
                                icon: Icon( Icons.close,color: Colors.red,size: 25),
                                onPressed: ClearAll ,
                               )


                          ),

                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  FormField(
                    builder: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Checkbox(

                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                      //  state.didChange(value);
                                    });
                                  }),
                              Text(
                                'j\'ai lu les les conditions et j\'accepte '
                                    'les  conditions\ngénerales d\'utilisations figurant dans la notice Légal',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Text(
                            state.errorText ?? '',
                            style: TextStyle(
                              // color: Theme.of(context).errorColor,
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      );
                    },
                     validator: (value) {
                            if (!isChecked) {
                              return 'Merci d\'accepter les conditions ';
                            }
                          },
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
              SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    CircularProgressIndicator();
                    Navigator.pushNamed(context, '/telephone');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Précédent',
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromRGBO(248, 90, 1, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 220,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    CircularProgressIndicator();
                    if (isChecked && _formKey.currentState!.validate()) {
                      CircularProgressIndicator();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationMail()));
                    }

                    setState(() {
                      //   _dataEmail= EnvoyerMail(emailController.text);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(248, 90, 1, 1),
                  ),
                  child: Text(
                    'Suivant',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} //TODO
