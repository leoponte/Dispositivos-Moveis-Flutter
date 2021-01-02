import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_01/firebase/functions.dart';
import 'package:trabalho_01/views/maindrawer/maindrawer.dart';
//import 'main.dart';

class MyPhilosophy extends StatelessWidget {
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
              .collection("Filosofia")
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
              return MyPhilosophyPage(category: snapshot.data);
            }
          },
        ));
  }
}

class MyPhilosophyPage extends StatefulWidget {
  final DocumentSnapshot category;

  MyPhilosophyPage({this.category});
  @override
  State<StatefulWidget> createState() =>
      MyPhilosophyPageState(category: category);
}

class MyPhilosophyPageState extends State<MyPhilosophyPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference filosofia =
      FirebaseFirestore.instance.collection("Filosofia");

  final GlobalKey<FormState> formKey4 = new GlobalKey<FormState>();
  final DocumentSnapshot category;
  var _context;

  MyPhilosophyPageState({this.category}) {
    introducao1 = category["introducao1"];
    antigOri1 = category["antigOri1"];
    antigOri2 = category["antigOri2"];
    antigOri3 = category["antigOri3"];
    antigOri4 = category["antigOri4"];
    antigOci1 = category["antigOci1"];
    antigOci2 = category["antigOci2"];
    antigOci3 = category["antigOci3"];
    antigOci4 = category["antigOci4"];
    antigOci5 = category["antigOci5"];
    antigOci6 = category["antigOci6"];
    transiIdm1 = category["transiIdm1"];
    transiIdm2 = category["transiIdm2"];
    transiIdm3 = category["transiIdm3"];
    filoMod1 = category["filoMod1"];
    filoMod2 = category["filoMod2"];
    filoMod3 = category["filoMod3"];
  }

  var introducao1;
  var antigOri1;
  var antigOri2;
  var antigOri3;
  var antigOri4;
  var antigOci1;
  var antigOci2;
  var antigOci3;
  var antigOci4;
  var antigOci5;
  var antigOci6;
  var transiIdm1;
  var transiIdm2;
  var transiIdm3;
  var filoMod1;
  var filoMod2;
  var filoMod3;

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
                Text("            Filosofia",
                    //textAlign: TextAlign.left,
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
              title: Text("Introdução à Filosofia",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: introducao1,
                          title: const Text("Introdução à Filosofia",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "introducao1": inValue,
                            });
                            setState(() {
                              introducao1 = inValue;
                            });
                          })),
                ),
              ]),
          Container(
            //Para fazer uma linha de separação
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ExpansionTile(
              title: Text("Filosofia Antiga - Antiguidade Oriental",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOri1,
                          title: const Text(
                              "Introdução à Filosofia do Oriente Médio",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOri1": inValue,
                            });
                            setState(() {
                              antigOri1 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOri2,
                          title: const Text("Os Egípcios",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOri2": inValue,
                            });
                            setState(() {
                              antigOri2 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOri3,
                          title: const Text("Os Mesopotâmicos",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOri3": inValue,
                            });
                            setState(() {
                              antigOri3 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOri4,
                          title: const Text("Os Hebreus",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOri4": inValue,
                            });
                            setState(() {
                              antigOri4 = inValue;
                            });
                          })),
                ),
              ]),
          Container(
            //Para fazer uma linha de separação
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ExpansionTile(
              title: Text("Filosofia Antiga - Antiguidade Ocidental",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOci1,
                          title: const Text("Introdução ao Mundo Grego",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOci1": inValue,
                            });
                            setState(() {
                              antigOci1 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOci2,
                          title: const Text(
                              "Pré-Socráticos ou Filósofos da Natureza",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOci2": inValue,
                            });
                            setState(() {
                              antigOci2 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOci3,
                          title: const Text("Sofistas",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOci3": inValue,
                            });
                            setState(() {
                              antigOci3 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOci4,
                          title: const Text("Socráticos - Sócrates",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOci4": inValue,
                            });
                            setState(() {
                              antigOci4 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOci5,
                          title: const Text("Socráticos - Platão",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOci5": inValue,
                            });
                            setState(() {
                              antigOci5 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: antigOci6,
                          title: const Text("Socráticos - Aristóteles",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "antigOci6": inValue,
                            });
                            setState(() {
                              antigOci6 = inValue;
                            });
                          })),
                ),
              ]),
          Container(
            //Para fazer uma linha de separação
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ExpansionTile(
              title: Text("Transição para a Idade Média",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: transiIdm1,
                          title: const Text("Filosofia Helenística",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "transiIdm1": inValue,
                            });
                            setState(() {
                              transiIdm1 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: transiIdm2,
                          title: const Text("Filosofia Medieval",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "transiIdm2": inValue,
                            });
                            setState(() {
                              transiIdm2 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: transiIdm3,
                          title: const Text("Pensamento Cristão",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "transiIdm3": inValue,
                            });
                            setState(() {
                              transiIdm3 = inValue;
                            });
                          })),
                ),
              ]),
          Container(
            //Para fazer uma linha de separação
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ExpansionTile(
              title: Text("Filosofia Moderna e Contemporânea",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: filoMod1,
                          title: const Text("Ciência Moderna",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "filoMod1": inValue,
                            });
                            setState(() {
                              filoMod1 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: filoMod2,
                          title: const Text("Ética e Moral",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "filoMod2": inValue,
                            });
                            setState(() {
                              filoMod2 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: filoMod3,
                          title: const Text("Verdade",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await filosofia.doc(getCurrentUserId()).update({
                              "filoMod3": inValue,
                            });
                            setState(() {
                              filoMod3 = inValue;
                            });
                          })),
                ),
              ]),
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
