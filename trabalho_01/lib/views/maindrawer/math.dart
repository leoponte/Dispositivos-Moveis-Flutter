import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:trabalho_01/firebase/database.dart';
import 'package:trabalho_01/views/maindrawer/maindrawer.dart';

class MyMath extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Matematica")
              .doc(getCurrentUserId())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              );
            } else {
              return MyMathPage(category: snapshot.data);
            }
          },
        ));
  }
}

//,
class MyMathPage extends StatefulWidget {
  final DocumentSnapshot category;

  MyMathPage({this.category});
  @override
  State<StatefulWidget> createState() {
    return MyMathPageState(category: category);
  }
}

class MyMathPageState extends State<MyMathPage> {
  final DocumentSnapshot category;

  MyMathPageState({this.category}) {
    matBasica1 = category["matBasica1"];
    matBasica2 = category["matBasica2"];
    matBasica3 = category["matBasica3"];
    matBasica4 = category["matBasica4"];
    matBasica5 = category["matBasica5"];
    matBasica6 = category["matBasica6"];
    matBasica7 = category["matBasica7"];
    matBasica8 = category["matBasica8"];
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference matematica =
      FirebaseFirestore.instance.collection("Matematica");

  var _context;
  final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();

  var matBasica1;
  var matBasica2;
  var matBasica3;
  var matBasica4;
  var matBasica5;
  var matBasica6;
  var matBasica7;
  var matBasica8;

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
        body: ListView(children: <Widget>[
          Container(
            //Para fazer uma linha de separação
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(600),
              ),
            ),
            child: Row(
              children: [
                Text("      Matemática",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Container(
                    padding:
                        EdgeInsets.only(left: 60, right: 0, top: 10, bottom: 0),
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
          //Separados em tópicos espansivos

          ExpansionTile(
            title: Text("Matemática Básica",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            children: <Widget>[
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica1,
                        title: const Text("Operações Básicas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica1": inValue,
                          });
                          setState(() {
                            matBasica1 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica2,
                        title: const Text("Porcentagem",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica2": inValue,
                          });
                          setState(() {
                            matBasica2 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica3,
                        title: const Text("Potenciação e Radiciação",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica3": inValue,
                          });
                          setState(() {
                            matBasica3 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica4,
                        title: const Text("Expressões Numéricas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica4": inValue,
                          });
                          setState(() {
                            matBasica4 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica5,
                        title: const Text("Múltiplos, Divisores, MDC e MMC",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica5": inValue,
                          });
                          setState(() {
                            matBasica5 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica6,
                        title: const Text("Operações Básicas com Polinômios",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica6": inValue,
                          });
                          setState(() {
                            matBasica6 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica7,
                        title: const Text("Frações, Decimais e Dízimas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica7": inValue,
                          });
                          setState(() {
                            matBasica7 = inValue;
                          });
                        })),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                        value: matBasica8,
                        title: const Text("Notação Científica",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica8": inValue,
                          });
                          setState(() {
                            matBasica8 = inValue;
                          });
                        })),
              ),
            ],
          ),
          Container(
            //Para fazer uma linha de separação
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
        ]));
  }
}
