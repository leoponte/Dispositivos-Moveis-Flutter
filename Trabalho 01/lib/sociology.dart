import 'package:flutter/material.dart';
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
      home: MySociologyPage(),
    );
  }
}

class MySociologyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySociologyPageState();
}

class _MySociologyPageState extends State<MySociologyPage> {
  var _context;
  final GlobalKey<FormState> formKey5 = new GlobalKey<FormState>();
  var introSoc = false;

  var natureza1 = false;
  var natureza2 = false;
  var natureza3 = false;

  var fundamentos1 = false;
  var fundamentos2 = false;
  var fundamentos3 = false;
  var fundamentos4 = false;

  var classicos1 = false;
  var classicos2 = false;
  var classicos3 = false;
  var classicos4 = false;

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
                key: formKey5,
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
                          Text("  Sociologia",
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Introdução ao Curso de Sociologia",
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
                          child: CheckboxListTile(
                            value: introSoc,
                            title: const Text("O Conhecimento e a Ciência",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                introSoc = inValue;
                              });
                            },
                          )),
                    ),
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
                                child: Text("Natureza e Cultura",
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
                          child: CheckboxListTile(
                            value: natureza1,
                            title: const Text("O que é o Homem?",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                natureza1 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: natureza2,
                            title: const Text("Natureza e Cultura",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                natureza2 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: natureza3,
                            title: const Text("Trabalho",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                natureza3 = inValue;
                              });
                            },
                          )),
                    ),
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
                                child: Text("Fundamentos da Sociologia",
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
                          child: CheckboxListTile(
                            value: fundamentos1,
                            title: const Text("A Modernidade",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                fundamentos1 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: fundamentos2,
                            title: const Text("O Nascimento da Sociologia",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                fundamentos2 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: fundamentos3,
                            title: const Text("O Estudo da Antropologia",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                fundamentos3 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: fundamentos4,
                            title: const Text("O Poder da Política",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                fundamentos4 = inValue;
                              });
                            },
                          )),
                    ),
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
                                child: Text("Clássicos da Sociologia",
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
                          child: CheckboxListTile(
                            value: classicos1,
                            title: const Text("Augusto Comte",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                classicos1 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: classicos2,
                            title: const Text("Émile Durkheim",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                classicos2 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: classicos3,
                            title: const Text("Max Weber",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                classicos3 = inValue;
                              });
                            },
                          )),
                    ),
                    Card(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: CheckboxListTile(
                            value: classicos4,
                            title: const Text("Karl Marx",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                classicos4 = inValue;
                              });
                            },
                          )),
                    ),
                  ],
                ))));
  }
}
