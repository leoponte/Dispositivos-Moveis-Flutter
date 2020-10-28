import 'package:flutter/material.dart';
//import 'main.dart';
import 'maindrawer.dart';

class MyHistory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHistoryPage(),
    );
  }
}

class MyHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHistoryPageState();
}

class _MyHistoryPageState extends State<MyHistoryPage> {
  var _context;
  final GlobalKey<FormState> formKey3 = new GlobalKey<FormState>();
  var morfologia1 = false;
  var morfologia2 = false;
  var morfologia3 = false;
  var morfologia4 = false;
  var morfologia5 = false;
  var morfologia6 = false;
  var morfologia7 = false;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                _context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyMainDrawer())),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formKey3,
                child: Column(
                  children: [
                    Container(
                      //para decorar a tela
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(10),
                          bottomRight: const Radius.circular(600),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text("  História",
                              //textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 60, right: 0, top: 10, bottom: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Stack(children: <Widget>[
                                    Image.asset(
                                      'assets/images/logoredondo.png',
                                      width: 70.0,
                                      height: 70.0,
                                    )
                                  ]))),
                        ],
                      ),
                    ),
                    Text(""),
                    Text(""),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Morfologia",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Substantivo",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia1,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia1 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Artigo",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia2,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia2 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Adjetivo",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia3,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia3 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Numeral",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia4,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia4 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Pronome",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia5,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia5 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Funções do Pronome Se",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia6,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia6 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Conectivos",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: morfologia7,
                              onChanged: (bool inValue) {
                                setState(() {
                                  morfologia7 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                  ],
                ))));
  }
}
