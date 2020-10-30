import 'package:flutter/material.dart';
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
      home: MyPortuguesePage(),
    );
  }
}

class MyPortuguesePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPortuguesePageState();
}

class _MyPortuguesePageState extends State<MyPortuguesePage> {
  var _context;
  final GlobalKey<FormState> formKey3 = new GlobalKey<FormState>();
  var morfologia1 = false;
  var morfologia2 = false;
  var morfologia3 = false;
  var morfologia4 = false;
  var morfologia5 = false;
  var morfologia6 = false;
  var morfologia7 = false;
  var morfologia8 = false;
  var morfologia9 = false;
  var morfologia10 = false;
  var morfologia11 = false;
  var morfologia12 = false;

  var formacao1 = false;
  var formacao2 = false;
  var formacao3 = false;

  var sintaxe1 = false;
  var sintaxe2 = false;
  var sintaxe3 = false;
  var sintaxe4 = false;

  var concordancia1 = false;
  var concordancia2 = false;

  var regencia1 = false;

  var oracoes1 = false;
  var oracoes2 = false;
  var oracoes3 = false;
  var oracoes4 = false;
  var oracoes5 = false;
  var oracoes6 = false;

  var ortografia1 = false;

  var regrasP1 = false;

  var regrasA1 = false;
  var regrasA2 = false;

  var semantica1 = false;

  var variacoes1 = false;

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
                          Text("  Português",
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
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          //height: 130.0,
                          //width: 500,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
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
                    ),
                    Card(
                      child: Container(
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
                                child: Text("Substantivo",
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
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Artigo",
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
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Adjetivo",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia3,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia3 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Numeral",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia4,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia4 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Pronome",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia5,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia5 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Funções do Pronome Se",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia6,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia6 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Conectivos",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia7,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia7 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Interjeição",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia8,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia8 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Verbo",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia9,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia9 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Advérbio",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia10,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia10 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Funções da Palavra Que",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia11,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia11 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Análise Morfológica",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: morfologia12,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    morfologia12 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Text(""),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Formação das Palavras",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Formação das Palavras",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: formacao1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    formacao1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Colocação das Palavras",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: formacao2,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    formacao2 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Colocação Pronomial",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: formacao3,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    formacao3 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Sintaxe",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Sujeito e Predicado",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: sintaxe1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    sintaxe1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Vocativo",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: sintaxe2,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    sintaxe2 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Termos Associados ao Verbo",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: sintaxe3,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    sintaxe3 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Termos Associados ao Nome",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: sintaxe4,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    sintaxe4 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Concordância",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Concordância Verbal",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: concordancia1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    concordancia1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Concordância Nominal",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: concordancia2,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    concordancia2 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Regência",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Regência",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: regencia1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    regencia1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Orações",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Orações Subordinadas Substantivas",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: oracoes1,
                              onChanged: (bool inValue) {
                                setState(() {
                                  oracoes1 = inValue;
                                });
                              },
                            ),
                          ],
                        )),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Orações Subordinadas Adjetivas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: oracoes2,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    oracoes2 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Orações Subordinadas Adverbiais",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: oracoes3,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    oracoes3 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Orações Subordinadas Reduzidas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: oracoes4,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    oracoes4 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Orações Coordenadas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: oracoes5,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    oracoes5 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Orações Intercaladas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: oracoes6,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    oracoes6 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Ortografia",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Ortografia",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: ortografia1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    ortografia1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Regras de Pontuação",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Regras de Pontuação",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: regrasP1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    regrasP1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Regras de Acentuação",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Acentuação Gráfica",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: regrasA1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    regrasA1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Crase",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: regrasA2,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    regrasA2 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Semântica",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Semântica",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: semantica1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    semantica1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Variações Linguísticas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Variações Linguísticas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(
                                value: variacoes1,
                                onChanged: (bool inValue) {
                                  setState(() {
                                    variacoes1 = inValue;
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                    Text(""),
                  ],
                ))));
  }
}
