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
        body: SingleChildScrollView());
  }
}
