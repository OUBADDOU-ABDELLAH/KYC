import 'package:cih/GlobalParametres/ClassVariables.dart';
import 'package:cih/GlobalParametres/functionsProject/OtpFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifierEmailOtp extends StatefulWidget {
  const VerifierEmailOtp({Key? key}) : super(key: key);

  @override
  State<VerifierEmailOtp> createState() => _VerifierEmailOtpState();
}

class _VerifierEmailOtpState extends State<VerifierEmailOtp> {
 Clients client=Clients("", "", "", "") ;
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
                      Navigator.pushNamed(context, "verifierMail");
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
      Text( 'Verification de l\'adresse mail',
          style: TextStyle(
            color: Color.fromRGBO(248, 91, 1, 1),
            fontSize: 22,
            fontFamily: 'ArvoBold'
          )),

      Text('\nConfirmez qu\'il s\'agit bien de vous en introduisant le code de confirmation reçu pa Email.\n'
          ' Ne communiquez ce code à personne.',
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
                  Navigator.pushNamed(context, "/verifierSmsOtp") ;
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
