import 'package:cih/GlobalParametres/Parameteres.dart';
import 'package:cih/Pages/MyHome.dart';
import 'package:flutter/material.dart';

class OuvrirCompte extends StatelessWidget {
  const OuvrirCompte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/myHome");
            },
            // icon: new Image.asset("images/IG.png"),
            icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),*/
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 20),
                        onPressed: () {
                          Navigator.pushNamed(context, "/myHome");
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 23, 0, 0),
                      child: Image(
                        // color: Colors.red,
                        image: AssetImage('images/logo.jpg'),
                        width: 170,
                        fit: BoxFit.contain,
                        height: 80,
                      ),
                    ),
                  ],
                ),



                Image(
                  image: AssetImage('images/CreditCard.jpg'),
                  height: 250,
                  fit: BoxFit.fill,
                  width: 450,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    'Ouvrez votre compte bancaire en queleques clics',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontFamily: 'Alfa'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    'Directement depuis chez vous',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 110,
                ),



                ...(ParamsHome.ListeO_S as List).map(
                      (item) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,15,10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '${item['route']}');
                            },
                            style: ElevatedButton.styleFrom(
                              side:item['side'],
                              primary: item['couleur'],
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(7),
                              ),

                            ),
                            child: item['title']),
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
