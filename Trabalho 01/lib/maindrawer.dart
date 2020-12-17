import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'about.dart';
import 'calendar.dart';
import 'math.dart';
import 'portuguese.dart';
import 'philosophy.dart';
import 'sociology.dart';

class MyMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMainDrawerPage(),
    );
  }
}

class LoginData {
  var checkboxValue = false;
  var checkboxValue1 = false;

  doSomething() {
    print("CheckBox: $checkboxValue");
  }
}

class MyMainDrawerPage extends StatefulWidget {
  final LoginData loginData = new LoginData();
  @override
  State<StatefulWidget> createState() => _MyMainDrawerPageState();
}

class _MyMainDrawerPageState extends State<MyMainDrawerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _MyMainDrawerPageState() {
    // coloca mensagem no final da tela

    scheduleMicrotask(() => _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Menu principal!'), duration: Duration(seconds: 5))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                      Text("   Nossas Lutas",
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
                  )
                ]),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0, top: 30.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.0),
                    elevation: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(children: <Widget>[
                              Image.asset(
                                'assets/images/cursinho.jpg',
                                width: 360.0,
                                height: 200.0,
                              )
                            ]))
                      ],
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0, top: 30.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.0),
                    elevation: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/one.jpg',
                          fit: BoxFit.cover,
                          width: 200.0,
                          height: 200.0,
                        ),
                        Container(
                            child: Flexible(
                          child: Text(
                              "   Você sabia que uma de\n nossas prioridades no \n CCP também é zelar pelo\n meio ambiente?\n   Esse projeto é um de\n muitos!\n   Nossos companheiros \n se reunem de manhã para\n separar os materiais de\n reciclagem coletados na\n região.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ))
                      ],
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0, top: 30.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.0),
                    elevation: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/mfeminista.jpg',
                          fit: BoxFit.cover,
                          width: 200.0,
                          height: 210.0,
                        ),
                        Container(
                            child: Flexible(
                          child: Text(
                              "   O Manifesto Feminista é\n o coletivo de mulheres\n formado pelas estudantes\n e voluntárias do CCP.\n   Desde 2008, o coletivo\n tem pautado as questões\n de gênero junto aos\n estudantes do cursinho,\n através de aulas de\n cidadania e dinamização\n de debates a partir da\n exibição de\n documentários.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ))
                      ],
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 30.0,
                    top: 30.0,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.0),
                    elevation: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(children: <Widget>[
                              Image.asset(
                                'assets/images/three.jpg',
                                width: 360.0,
                                height: 200.0,
                              )
                            ]))
                      ],
                    ),
                  )),
            ],
          ),
        ),
        drawer: Drawer(child: mySecondListView()));
  }

  Widget mySecondListView() {
    return ListView(
      children: <Widget>[
        Container(
            height: 150.0,
            child: DrawerHeader(
              child: Text(""),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(
                      image: AssetImage("assets/images/ccpp.jpg"),
                      fit: BoxFit.fill)),
            ),
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0)),
        //Usado na drawer como tópicos clicáveis
        ListTile(
            leading: Icon(Icons.info),
            title: Text("História",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyAbout()));
            }),
        ExpansionTile(
          leading: Icon(Icons.book),
          title: Text("Roteiro de Estudos",
              style: TextStyle(fontSize: 20, color: Colors.black)),
          trailing: Icon(Icons.arrow_forward_ios),
          children: <Widget>[
            ListTile(
                title: Text("                  Matemática",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyMath()));
                }),
            ListTile(
                title: Text("                  Português",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyPortuguese()));
                }),
            ListTile(
                title: Text("                  Filosofia",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyPhilosophy()));
                }),
            ListTile(
                title: Text("                  Sociologia",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MySociology()));
                })
          ],
        ),
        ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Calendário",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyCalendar()));
            }),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
            }),
        Container(
          //para decorar a tela
          padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 402),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(10),
              topLeft: const Radius.circular(400),
            ),
          ),
        )
      ],
    );
  }
}
