import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_01/bloc/auth_event.dart';
import 'package:trabalho_01/firebase/functions.dart';
import 'package:trabalho_01/views/maindrawer/calendar/calendar.dart';
import 'package:trabalho_01/views/maindrawer/itemhomepage.dart';

import 'package:trabalho_01/views/maindrawer/subjects/math.dart';
import 'package:trabalho_01/views/maindrawer/subjects/philosophy.dart';
import 'package:trabalho_01/views/maindrawer/subjects/portuguese.dart';
import 'package:trabalho_01/views/maindrawer/subjects/sociology.dart';

import '../../bloc/auth_bloc.dart';

import 'dart:async';
import 'about.dart';

class MyMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Informações adicionais")
            .doc(getCurrentUserId())
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            );
          } else {
            return MyMainDrawerPage(category: snapshot.data);
          }
        },
      ),
    );
  }
}

class MyMainDrawerPage extends StatefulWidget {
  final DocumentSnapshot category;

  MyMainDrawerPage({this.category});

  @override
  State<StatefulWidget> createState() => _MyMainDrawerPageState(category);
}

class _MyMainDrawerPageState extends State<MyMainDrawerPage> {
  final DocumentSnapshot category;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _MyMainDrawerPageState(this.category) {
    // coloca mensagem no final da tela
    String nome = category['Nome'];
    List primeiroNome = [];
    primeiroNome = nome.split(" ");

    scheduleMicrotask(() => _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Olá, ' + primeiroNome[0] + '!'),
        duration: Duration(seconds: 5))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: ListView(children: [
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
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Home").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              } else {
                //Listar os conteudos do menu principal
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemHomePage(
                        url: snapshot.data.docs[index]["url"],
                        text: snapshot.data.docs[index]["text"]);
                  },
                );
              }
            },
          ),
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
        ]),
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
              BlocProvider.of<AuthBloc>(context).add(Logout());
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
