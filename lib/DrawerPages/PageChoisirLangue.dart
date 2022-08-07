import 'package:flutter/material.dart';
import '../Pages/MyDrawer.dart';
class ChoisirLangue extends StatelessWidget {
  const ChoisirLangue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      drawer: MyDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(color: Colors.blue),
        flexibleSpace: Container(
          margin: EdgeInsets.fromLTRB(0,10,0,0) ,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/transparent.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.orange,
            height: 2,
          ),
          preferredSize: Size.fromHeight(10),
        ),
      ),

    );
  }
}
