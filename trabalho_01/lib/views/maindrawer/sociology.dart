import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_01/firebase/database.dart';
//import 'main.dart';
import 'maindrawer.dart';

class MySociology extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Sociologia")
              .doc(getCurrentUserId())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else {
              return MySociologyPage(category: snapshot.data);
            }
          },
        ));
  }
}

class MySociologyPage extends StatefulWidget {
  final DocumentSnapshot category;

  MySociologyPage({this.category});

  @override
  State<StatefulWidget> createState() =>
      MySociologyPageState(category: category);
}

class MySociologyPageState extends State<MySociologyPage> {
  final DocumentSnapshot category;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference sociologia =
      FirebaseFirestore.instance.collection("Sociologia");
  final GlobalKey<FormState> formKey5 = new GlobalKey<FormState>();
  var _context;

  MySociologyPageState({this.category}) {
    introSoc = category["introSoc"];

    natureza1 = category["natureza1"];
    natureza2 = category["natureza2"];
    natureza3 = category["natureza3"];

    fundamentos1 = category["fundamentos1"];
    fundamentos2 = category["fundamentos2"];
    fundamentos3 = category["fundamentos3"];
    fundamentos4 = category["fundamentos4"];

    classicos1 = category["classicos1"];
    classicos2 = category["classicos2"];
    classicos3 = category["classicos3"];
    classicos4 = category["classicos4"];
  }

  var introSoc;

  var natureza1;
  var natureza2;
  var natureza3;

  var fundamentos1;
  var fundamentos2;
  var fundamentos3;
  var fundamentos4;

  var classicos1;
  var classicos2;
  var classicos3;
  var classicos4;

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
                Text("         Sociologia",
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
            title: Text("Introdução ao Curso de Sociologia",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            children: <Widget>[
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: introSoc,
                      title: const Text("O Conhecimento e a Ciência",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "introSoc": inValue,
                        });
                        setState(() {
                          introSoc = inValue;
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
          ExpansionTile(
            title: Text("Natureza e Cultura",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            children: <Widget>[
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: natureza1,
                      title: const Text("O que é o Homem?",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "natureza1": inValue,
                        });
                        setState(() {
                          natureza1 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: natureza2,
                      title: const Text("Natureza e Cultura",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "natureza2": inValue,
                        });
                        setState(() {
                          natureza2 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: natureza3,
                      title: const Text("Trabalho",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "natureza3": inValue,
                        });
                        setState(() {
                          natureza3 = inValue;
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
          ExpansionTile(
            title: Text("Fundamentos de Sociologia",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            children: <Widget>[
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: fundamentos1,
                      title: const Text("A Modernidade",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "fundamentos1": inValue,
                        });
                        setState(() {
                          fundamentos1 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: fundamentos2,
                      title: const Text("O Nascimento da Sociologia",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "fundamentos2": inValue,
                        });
                        setState(() {
                          fundamentos2 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: fundamentos3,
                      title: const Text("O Estudo da Antropologia",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "fundamentos3": inValue,
                        });
                        setState(() {
                          fundamentos3 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: fundamentos4,
                      title: const Text("O Poder da Política",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "fundamentos4": inValue,
                        });
                        setState(() {
                          fundamentos4 = inValue;
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
          ExpansionTile(
            title: Text("Clássicos de Sociologia",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            children: <Widget>[
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: classicos1,
                      title: const Text("Augusto Comte",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "classicos1": inValue,
                        });
                        setState(() {
                          classicos1 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: classicos2,
                      title: const Text("Émile Durkheim",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "classicos2": inValue,
                        });
                        setState(() {
                          classicos2 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: classicos3,
                      title: const Text("Max Weber",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "classicos3": inValue,
                        });
                        setState(() {
                          classicos3 = inValue;
                        });
                      },
                    )),
              ),
              Card(
                child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
                    child: CheckboxListTile(
                      value: classicos4,
                      title: const Text("Karl Marx",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      onChanged: (bool inValue) async {
                        await sociologia.doc(getCurrentUserId()).update({
                          "classicos4": inValue,
                        });
                        setState(() {
                          classicos4 = inValue;
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
