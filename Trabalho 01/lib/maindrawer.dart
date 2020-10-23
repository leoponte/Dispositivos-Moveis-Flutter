import 'package:flutter/material.dart';
import 'main.dart';
//import 'register.dart';
import 'dart:async';
import 'about.dart';
import 'calendar.dart';
import 'math.dart';
import 'portuguese.dart';
import 'history.dart';
import 'geography.dart';

class MyMainDrawer extends StatelessWidget {
  // This widget is the root of your application.
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
    scheduleMicrotask(() => _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Bem vinde!'), duration: Duration(seconds: 5))));
  }

  @override
  Widget build(BuildContext context) {
    //this._context = context;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Container(),
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
        ListTile(
            leading: Icon(Icons.info),
            title: Text("Sobre",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("Sobre");
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
                  print("DEU CERTO");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyMath()));
                }),
            ListTile(
                title: Text("                   Português",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  print("DEU CERTO");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyPortuguese()));
                }),
            ListTile(
                title: Text("                      História",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  print("DEU CERTO");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyHistory()));
                }),
            ListTile(
                title: Text("                    Geografia",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                onTap: () {
                  print("DEU CERTO");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyGeography()));
                })
          ],
        ),
        ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Calendário",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("ASDF");
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
              print("ASDF");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
            }),
        Container(
          //para decorar a tela
          padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 338),
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
