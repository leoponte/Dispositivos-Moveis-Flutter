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

  var mycheckbox = false;

  doSomething() {
    print("Username: $username");
    print("Password: $password");
    print("");
    print("CheckBox: $mycheckbox");
    print("");
  }
}

class MyMathPage extends StatefulWidget {
  final LoginData1 loginData1 = new LoginData1();

  @override
  State<StatefulWidget> createState() {
    return _MyMathPageState(loginData1);
  }
}

class _MyMathPageState extends State<MyMathPage> {
  var _context;
  final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();
  final LoginData1 loginData1;
  var matBasica1 = false;
  var matBasica2 = false;
  var matBasica3 = false;
  var matBasica4 = false;
  var matBasica5 = false;
  var matBasica6 = false;
  var matBasica7 = false;

  @override
  _MyMathPageState(this.loginData1);

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
                key: formKey2,
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
                          Text("  Matemática",
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
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Matemática Básica",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Operações Básicas",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica1,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica1 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Potenciação e Radiciação",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica2,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica2 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Expressões Numéricas",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica3,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica3 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "     Múltiplos, Divisores, MDC e MMC",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica4,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica4 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "     Operações Básicas com Polinômios",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica5,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica5 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Frações, Decimais e Dízimas",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica6,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica6 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        //height: 130.0,
                        //width: 500,
                        //decoration: BoxDecoration(
                        //color: Colors.white,
                        // borderRadius: BorderRadius.circular(40),
                        // border: Border.all(color: Colors.black, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("     Notação Científica",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Checkbox(
                              value: matBasica7,
                              onChanged: (bool inValue) {
                                setState(() {
                                  matBasica7 =
                                      inValue; //checkbox colocando do lado do texto pela Row
                                });
                              },
                            ),
                          ],
                        )),
                  ],
                ))));
  }
}
