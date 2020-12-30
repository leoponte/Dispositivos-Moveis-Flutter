import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_01/firebase/database.dart';
//import 'main.dart';
import 'maindrawer.dart';

class MyPortuguese extends StatelessWidget {
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
            .collection("Portugues")
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
            return MyPortuguesePage(category: snapshot.data);
          }
        },
      ),
    );
  }
}

class MyPortuguesePage extends StatefulWidget {
  final DocumentSnapshot category;

  MyPortuguesePage({this.category});

  @override
  State<StatefulWidget> createState() =>
      MyPortuguesePageState(category: category);
}

class MyPortuguesePageState extends State<MyPortuguesePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference portugues =
      FirebaseFirestore.instance.collection("Portugues");
  final GlobalKey<FormState> formKey3 = new GlobalKey<FormState>();
  final DocumentSnapshot category;
  var _context;

  MyPortuguesePageState({this.category}) {
    morfologia1 = category["morfologia1"];
    morfologia2 = category["morfologia2"];
    morfologia3 = category["morfologia3"];
    morfologia4 = category["morfologia4"];
    morfologia5 = category["morfologia5"];
    morfologia6 = category["morfologia6"];
    morfologia7 = category["morfologia7"];
    morfologia8 = category["morfologia8"];
    morfologia9 = category["morfologia9"];
    morfologia10 = category["morfologia10"];
    morfologia11 = category["morfologia11"];
    morfologia12 = category["morfologia12"];

    formacao1 = category["formacao1"];
    formacao2 = category["formacao2"];
    formacao3 = category["formacao3"];

    sintaxe1 = category["sintaxe1"];
    sintaxe2 = category["sintaxe2"];
    sintaxe3 = category["sintaxe3"];
    sintaxe4 = category["sintaxe4"];

    concordancia1 = category["concordancia1"];
    concordancia2 = category["concordancia2"];

    regencia1 = category["regencia1"];

    oracoes1 = category["oracoes1"];
    oracoes2 = category["oracoes2"];
    oracoes3 = category["oracoes3"];
    oracoes4 = category["oracoes4"];
    oracoes5 = category["oracoes5"];
    oracoes6 = category["oracoes6"];

    ortografia1 = category["ortografia1"];

    regrasP1 = category["regrasP1"];

    regrasA1 = category["regrasA1"];
    regrasA2 = category["regrasA2"];

    semantica1 = category["semantica1"];

    variacoes1 = category["variacoes1"];
  }

  var morfologia1;
  var morfologia2;
  var morfologia3;
  var morfologia4;
  var morfologia5;
  var morfologia6;
  var morfologia7;
  var morfologia8;
  var morfologia9;
  var morfologia10;
  var morfologia11;
  var morfologia12;

  var formacao1;
  var formacao2;
  var formacao3;

  var sintaxe1;
  var sintaxe2;
  var sintaxe3;
  var sintaxe4;

  var concordancia1;
  var concordancia2;

  var regencia1;

  var oracoes1;
  var oracoes2;
  var oracoes3;
  var oracoes4;
  var oracoes5;
  var oracoes6;

  var ortografia1;

  var regrasP1;

  var regrasA1;
  var regrasA2;

  var semantica1;

  var variacoes1;

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
                Text("         Português",
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
              title: Text("Morfologia",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia1,
                        title: const Text("Substantivo",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia1": inValue,
                          });
                          setState(() {
                            morfologia1 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia2,
                        title: const Text("Artigo",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia2": inValue,
                          });
                          setState(() {
                            morfologia2 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia3,
                        title: const Text("Adjetivo",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia3": inValue,
                          });
                          setState(() {
                            morfologia3 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia4,
                        title: const Text("Numeral",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia4": inValue,
                          });
                          setState(() {
                            morfologia4 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia5,
                        title: const Text("Pronome",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia5": inValue,
                          });
                          setState(() {
                            morfologia5 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia6,
                        title: const Text("Função do Pronome Se",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia6": inValue,
                          });
                          setState(() {
                            morfologia6 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia7,
                        title: const Text("Conectivos",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia7": inValue,
                          });
                          setState(() {
                            morfologia7 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia8,
                        title: const Text("Interjeição",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia8": inValue,
                          });
                          setState(() {
                            morfologia8 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia9,
                        title: const Text("Verbo",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia9": inValue,
                          });
                          setState(() {
                            morfologia9 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia10,
                        title: const Text("Advérbio",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia10": inValue,
                          });
                          setState(() {
                            morfologia10 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia11,
                        title: const Text("Funções da Palavra Que",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia11": inValue,
                          });
                          setState(() {
                            morfologia11 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: morfologia12,
                        title: const Text("Análise Morfológica",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "morfologia12": inValue,
                          });
                          setState(() {
                            morfologia12 = inValue;
                          });
                        },
                      )),
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
              title: Text("Formação das Palavras",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: formacao1,
                        title: const Text("Formação das Palavras",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "formacao1": inValue,
                          });
                          setState(() {
                            formacao1 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: formacao2,
                        title: const Text("Colocação das Palavras",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "formacao2": inValue,
                          });
                          setState(() {
                            formacao2 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: formacao3,
                        title: const Text("Colocação Pronomial",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "formacao3": inValue,
                          });
                          setState(() {
                            formacao3 = inValue;
                          });
                        },
                      )),
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
              title: Text("Sintaxe",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: sintaxe1,
                        title: const Text("Sujeito e Predicado",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "sintaxe1": inValue,
                          });
                          setState(() {
                            sintaxe1 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: sintaxe2,
                        title: const Text("Vocativo",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "sintaxe2": inValue,
                          });
                          setState(() {
                            sintaxe2 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: sintaxe3,
                        title: const Text("Termos Associados ao Verbo",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "sintaxe3": inValue,
                          });
                          setState(() {
                            sintaxe3 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: sintaxe4,
                        title: const Text("Termos Associados ao Nome",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "sintaxe4": inValue,
                          });
                          setState(() {
                            sintaxe4 = inValue;
                          });
                        },
                      )),
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
              title: Text("Concordância",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: concordancia1,
                        title: const Text("Concordância Verbal",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "concordancia1": inValue,
                          });
                          setState(() {
                            concordancia1 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: concordancia2,
                        title: const Text("Concordância Nominal",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "concordancia2": inValue,
                          });
                          setState(() {
                            concordancia2 = inValue;
                          });
                        },
                      )),
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
              title: Text("Regência",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: regencia1,
                        title: const Text("Regência",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "regencia1": inValue,
                          });
                          setState(() {
                            regencia1 = inValue;
                          });
                        },
                      )),
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
              title: Text("Orações",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: oracoes1,
                        title: const Text("Orações Subordinadas Substantivas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "oracoes1": inValue,
                          });
                          setState(() {
                            oracoes1 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: oracoes2,
                        title: const Text("Orações Subordinadas Adjetivas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "oracoes2": inValue,
                          });
                          setState(() {
                            oracoes2 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: oracoes3,
                        title: const Text("Orações Subordinadas Adverbiais",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "oracoes3": inValue,
                          });
                          setState(() {
                            oracoes3 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: oracoes4,
                        title: const Text("Orações Subordinadas Reduzidas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "oracoes4": inValue,
                          });
                          setState(() {
                            oracoes4 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: oracoes5,
                        title: const Text("Orações Coordenadas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "oracoes5": inValue,
                          });
                          setState(() {
                            oracoes5 = inValue;
                          });
                        },
                      )),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: oracoes6,
                        title: const Text("Orações Intercaladas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "oracoes6": inValue,
                          });
                          setState(() {
                            oracoes6 = inValue;
                          });
                        },
                      )),
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
              title: Text("Ortografia",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: ortografia1,
                          title: const Text("Ortografia",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await portugues.doc(getCurrentUserId()).update({
                              "ortografia1": inValue,
                            });
                            setState(() {
                              ortografia1 = inValue;
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
              title: Text("Regras de Pontuação",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: regrasP1,
                          title: const Text("Regras de Pontuação",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await portugues.doc(getCurrentUserId()).update({
                              "regrasP1": inValue,
                            });
                            setState(() {
                              regrasP1 = inValue;
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
              title: Text("Regras de Acentuação",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                          value: regrasA1,
                          title: const Text("Acentuação Gráfica",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          onChanged: (bool inValue) async {
                            await portugues.doc(getCurrentUserId()).update({
                              "regrasA1": inValue,
                            });
                            setState(() {
                              regrasA1 = inValue;
                            });
                          })),
                ),
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: regrasA2,
                        title: const Text("Crase",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "regrasA2": inValue,
                          });
                          setState(() {
                            regrasA2 = inValue;
                          });
                        },
                      )),
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
              title: Text("Semântica",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: semantica1,
                        title: const Text("Semântica",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "semantica1": inValue,
                          });
                          setState(() {
                            semantica1 = inValue;
                          });
                        },
                      )),
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
              title: Text("Variações Linguísticas",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              children: <Widget>[
                Card(
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 0, top: 0, bottom: 0),
                      child: CheckboxListTile(
                        value: variacoes1,
                        title: const Text("Variações Linguísticas",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                        onChanged: (bool inValue) async {
                          await portugues.doc(getCurrentUserId()).update({
                            "variacoes1": inValue,
                          });
                          setState(() {
                            variacoes1 = inValue;
                          });
                        },
                      )),
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
