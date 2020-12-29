import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_01/bloc/database_event.dart';
import 'package:trabalho_01/firebase/database.dart';
import 'package:trabalho_01/views/maindrawer/maindrawer.dart';

import 'package:trabalho_01/models/studies_models.dart';

class MyMath extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMathPage(),
    );
  }
}

class MyMathPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyMathPageState();
  }
}

class MyMathPageState extends State<MyMathPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference matematica =
      FirebaseFirestore.instance.collection("Matematica");

  bool residentialUnit;
/*
  someData() {
    String result1;
    FirebaseFirestore.instance
        .collection("Matematica")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        result1 = (result.data()["matBasica1"]);
      });
      print(Future.value(result1));
      return result1 as bool;
    });
  }
*/

/*
  teste() async {
    Firestore.instance
        .collection("Matematica")
        .document(someMethod())
        .snapshots()
        .listen((snapshot) {
      print(residentialUnit);
      residentialUnit = snapshot.data()["matBasica1"];
      print(residentialUnit);
      return residentialUnit;
    });
  }
*/
  var _context;
  final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();
  final Math book;
  MyMathPageState({this.book}) : super();

  var matBasica1 = false;
  var matBasica2 = false;
  var matBasica3 = false;
  var matBasica4 = false;
  var matBasica5 = false;
  var matBasica6 = false;
  var matBasica7 = false;
  var matBasica8 = false;

  @override
  Widget build(BuildContext context) {
    // var docRef = mathCollections.doc(someMethod());
    //bool value = (bool) docRef.;
/*
    Firestore.instance
        .collection("Matematica")
        .document(someMethod())
        .snapshots()
        .listen((snapshot) {
      print(residentialUnit);
      residentialUnit = snapshot.data()["matBasica1"];
      print(residentialUnit);
    });
*/
    //bool sim = dataData();

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
                          setState(() {
                            matBasica1 = inValue;
                          });
                          print(getCurrentUserId());
                          await matematica.doc(getCurrentUserId()).update({
                            "matBasica1": inValue,
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica2 = inValue;
                        });
                      },
                    )),
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica3 = inValue;
                        });
                      },
                    )),
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica4 = inValue;
                        });
                      },
                    )),
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica5 = inValue;
                        });
                      },
                    )),
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica6 = inValue;
                        });
                      },
                    )),
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica7 = inValue;
                        });
                      },
                    )),
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
                      onChanged: (bool inValue) {
                        setState(() {
                          matBasica8 = inValue;
                        });
                      },
                    )),
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
