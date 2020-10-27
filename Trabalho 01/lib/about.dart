import 'package:flutter/material.dart';
//import 'main.dart';
import 'maindrawer.dart';

class MyAbout extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyAboutPage(),
    );
  }
}

class MyAboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  var _context;
  var crossFadeFirst = true;

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
            child: Column(children: [
          Container(
            //para decorar a tela
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(600),
              ),
            ),
            child: Column(children: [
              Row(
                children: [
                  Text("        História",
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 40.0,
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
              )
            ]),
          ),
          Container(
              child: Stack(children: <Widget>[
            AnimatedCrossFade(
              duration: Duration(seconds: 2),
              firstChild: Image.asset(
                'assets/images/romulo.jpg',
                width: 400.0,
                height: 200.0,
              ),
              secondChild: Image.asset(
                'assets/images/cursinho.jpeg',
                width: 400.0,
                height: 250.0,
              ),
              crossFadeState: crossFadeFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            Positioned(
                bottom: 100.0,
                left: 330.0,
                child: FloatingActionButton(
                  onPressed: () {
                    // Call setState. This tells Flutter to rebuild the
                    // UI with the changes.
                    setState(() {
                      if (crossFadeFirst == true) {
                        crossFadeFirst = false;
                      } else {
                        crossFadeFirst = true;
                      }
                    });
                  },
                  tooltip: 'Toggle Opacity',
                  child: Icon(Icons.arrow_forward_ios),
                )),
          ])),
          Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              //color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 20)),
              child: Text(
                  "   Idealizado e fundado pelo Professor Rômulo Ornelas, desde 2002 vem fazendo uma revolução silenciosa na periferia de Guarulhos, ajudando a colocar centenas de jovens nas melhores universidades do Brasil.\n    Projeto 100% voluntariado, onde a maior parte dos voluntários são ex-alunos e pais de alunos.\n   Premiado várias vezes como melhor Cursinho Comunitário de São Paulo pelo alto índice de aprovação nas Universidades públicas.\n   Também conhecido por desenvolver uma pedagógica solidária, na qual todos e todas são agentes criadores do conhecimento.\n   Um projeto autossustentável.",
                  textAlign: TextAlign.justify,
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'britannic-bold.ttf',
                      fontWeight: FontWeight.normal,
                      color: Colors.black))),
          Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Row(children: [
                Container(
                    padding:
                        EdgeInsets.only(left: 80, right: 0, top: 0, bottom: 0),
                    child: GestureDetector(
                        child: Image.asset(
                          'assets/images/logoface.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                        onTap: () {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title:
                                        Text("@cursinhocomunitariopimentascp"));
                              },
                              barrierDismissible: true);
                        })),
                Container(
                    padding:
                        EdgeInsets.only(left: 30, right: 0, top: 0, bottom: 0),
                    child: GestureDetector(
                        child: Image.asset(
                          'assets/images/logoyout.png',
                          width: 95.0,
                          height: 95.0,
                        ),
                        onTap: () {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text("cursinhopimentas"));
                              },
                              barrierDismissible: true);
                        })),
              ]))
        ])));
  }
}
