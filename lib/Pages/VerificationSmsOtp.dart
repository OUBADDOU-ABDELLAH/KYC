import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/GlobalParametres/functionsProject/OtpFunction.dart';
import 'package:flutter/material.dart';

import '../GlobalParametres/functionsProject/PopUp.dart';

class VerificationSms extends StatefulWidget {
  const VerificationSms({Key? key}) : super(key: key);

  @override
  State<VerificationSms> createState() => _VerificationSmsState();
}

class _VerificationSmsState extends State<VerificationSms> {
  Clients client = Clients("", "", "", "");
  AfficherPopUp _popUp=AfficherPopUp() ;
  OTP txtOtp =OTP() ;
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
                onPressed: (){client.openDialog(context);},

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
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title:          Padding(
            padding: const EdgeInsets.fromLTRB(0,50,0,0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.blue, size: 20),
                  onPressed: () {
                    Navigator.pushNamed(context, "/verifierEmailOtp");
                  },
                ),
                SizedBox(
                  width: 80,
                ),
                Image(image: AssetImage('images/logo.jpg'))
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text( 'Sms de Verification ',
                  style: TextStyle(
                      color: Color.fromRGBO(248, 91, 1, 1),
                      fontSize: 22,
                      fontFamily: 'ArvoBold'
                  )),
SizedBox(
  height: 20,
),
              Text('Veuillez saisir le code confidentiel'
                  ' reçu par SMS. \nNe communiquez ce code à personne.',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'avenir'
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Form(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          txtOtp.TEXTFIELD_OTP(context) ,
                          SizedBox(
                            width: 10,
                          ),
                          txtOtp.TEXTFIELD_OTP(context) ,
                        ],
                      ),
                      Text('-'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          txtOtp.TEXTFIELD_OTP(context) ,
                          SizedBox(
                            width: 10,
                          ),
                          txtOtp.TEXTFIELD_OTP(context) ,
                        ],
                      ),
                      Text('-'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          txtOtp.TEXTFIELD_OTP(context) ,
                          SizedBox(
                            width: 10,
                          ),
                          txtOtp.TEXTFIELD_OTP(context) ,
                        ],
                      )


                    ],
                  )
              )


            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(30,0,0,0),
          child:
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed:(){
                _popUp.openDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(248, 90, 1, 1),
                onSurface: Color.fromRGBO(248, 90, 1, 1),
              ),
              child: Text(
                'Valider',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontFamily: 'LatoBold'),
              ),
            ),
          ),

        ),
      ),

    );
  }
}
