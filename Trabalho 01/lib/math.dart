import 'package:flutter/material.dart';
//import 'main.dart';
import 'maindrawer.dart';

class MyMath extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMathPage(),
    );
  }
}

class LoginData1 {
  String username = "";
  String password = "";

  var checkboxValue = false;
  var checkboxValue1 = false;

  var switchValue = false;
  var radioValue = 1;

  doSomething() {
    print("Username: $username");
    print("Password: $password");
    print("");
    print("CheckBox: $checkboxValue");
    print("Switch: $switchValue");
    print("Radio: $radioValue");
    print("");
  }
}

class MyMathPage extends StatefulWidget {
  final LoginData1 loginData1 = new LoginData1();

  State<StatefulWidget> createState() => _MyMathPageState();
}

class _MyMathPageState extends State<MyMathPage> {
  var _context;
  final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
        appBar: AppBar(
          title: Text("Matemática"),
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
                key: formKey2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      //height: 130.0,
                      //width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text("Matemática",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Checkbox(value: false, onChanged: null),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      //height: 130.0,
                      //width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text("Matemática",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Radio(value: 0, groupValue: null, onChanged: null)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
