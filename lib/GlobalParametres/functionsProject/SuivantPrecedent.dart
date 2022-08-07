import 'package:flutter/material.dart';
class SuivantPrecedent{

  Precedent(String url,context){
    return  SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          CircularProgressIndicator();
          Navigator.pushNamed(context,url);
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
    );
  }
  }

