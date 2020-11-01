import 'package:flutter/material.dart';
//import 'main.dart';
import 'maindrawer.dart';

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
      home: MyPhilosophyPage(),
    );
  }
}

class MyPhilosophyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPhilosophyPageState();
}

class _MyPhilosophyPageState extends State<MyPhilosophyPage> {
  var _context;
  final GlobalKey<FormState> formKey4 = new GlobalKey<FormState>();
  var introducao1 = false;

  var antigOri1 = false;
  var antigOri2 = false;
  var antigOri3 = false;
  var antigOri4 = false;

  var antigOci1 = false;
  var antigOci2 = false;
  var antigOci3 = false;
  var antigOci4 = false;
  var antigOci5 = false;
  var antigOci6 = false;

  var transiIdm1 = false;
  var transiIdm2 = false;
  var transiIdm3 = false;

  var filoMod1 = false;
  var filoMod2 = false;
  var filoMod3 = false;

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
                key: formKey4,
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
                          Text("  Filosofia      ",
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
                                child: Text("Introdução à Filosofia",
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
                              left: 20, right: 0, top: 0, bottom: 0),
                          child: CheckboxListTile(
                            value: introducao1,
                            title: const Text("Introdução à Filosofia",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                introducao1 = inValue;
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
                                child: Text(
                                    "Filosofia Antiga - Antiguidade Oriental",
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
                              left: 20, right: 0, top: 0, bottom: 0),
                          child: CheckboxListTile(
                            value: antigOri1,
                            title: const Text(
                                "Introdução à Filosofia do Oriente Médio",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOri1 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOri2 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOri3 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOri4 = inValue;
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
                                child: Text(
                                    "Filosofia Antiga - Antiguidade Ocidental",
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
                              left: 20, right: 0, top: 0, bottom: 0),
                          child: CheckboxListTile(
                            value: antigOci1,
                            title: const Text("Introdução ao Mundo Grego",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOci1 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOci2 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOci3 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOci4 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOci5 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                antigOci6 = inValue;
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
                                child: Text("Transição da Id. para a Id. Média",
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
                              left: 20, right: 0, top: 0, bottom: 0),
                          child: CheckboxListTile(
                            value: transiIdm1,
                            title: const Text("Filosofia Helenística",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                transiIdm1 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                transiIdm2 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                transiIdm3 = inValue;
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
                                child: Text("Filosofia Moderna e Contemporânea",
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
                              left: 20, right: 0, top: 0, bottom: 0),
                          child: CheckboxListTile(
                            value: filoMod1,
                            title: const Text("Ciência Moderna",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (bool inValue) {
                              setState(() {
                                filoMod1 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                filoMod2 = inValue;
                              });
                            },
                          )),
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
                            onChanged: (bool inValue) {
                              setState(() {
                                filoMod3 = inValue;
                              });
                            },
                          )),
                    ),
                  ],
                ))));
  }
}
