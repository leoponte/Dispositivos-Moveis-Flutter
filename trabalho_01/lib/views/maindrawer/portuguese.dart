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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
                          setState(() {
                            ortografia1 = inValue;
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
                        onChanged: (bool inValue) {
                          setState(() {
                            regrasP1 = inValue;
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
                        onChanged: (bool inValue) {
                          setState(() {
                            regrasA1 = inValue;
                          });
                        },
                      )),
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
                        onChanged: (bool inValue) {
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
