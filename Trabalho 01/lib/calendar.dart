import 'package:flutter/material.dart';
//import 'main.dart';
import 'maindrawer.dart';

class MyCalendar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCalendarPage(),
    );
  }
}

class MyCalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPage> {
  var _context;

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
                  Text("        Calendário",
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
            ]),
          ),
          Container(
            child: Text("\n   EM CONSTRUÇÃO  ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          )
        ])));
  }
}
