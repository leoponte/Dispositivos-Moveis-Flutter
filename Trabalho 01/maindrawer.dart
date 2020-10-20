import 'package:flutter/material.dart';

import 'main.dart';
import 'register.dart';

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
  State<StatefulWidget> createState() => _MyMainDrawerPageState(loginData);
}

class _MyMainDrawerPageState extends State<MyMainDrawerPage> {
  //var _context;
  final LoginData loginData;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  _MyMainDrawerPageState(this.loginData);

  @override
  Widget build(BuildContext context) {
    //this._context = context;

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Doido"),
        ),
        body: SingleChildScrollView(child: Container(child: Center(
          child: MaterialButton(
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(
                  new SnackBar(content: new Text("Saved Successfully")));
            },
          ),
        ))));
  }
}
