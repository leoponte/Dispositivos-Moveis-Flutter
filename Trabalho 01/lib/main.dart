import 'package:flutter/material.dart';
import 'register.dart';
import 'maindrawer.dart';

//MyTheme currentTheme = MyTheme(); // Usado para mudança de ligth mode para night mode

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppCreate();
  }
}

class _MyAppCreate extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nosso primeiro BottomNavigationBar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MyAppPages(),
      ),
    );
  }
}

class LoginData {
  String username = "";
  String password = "";

  var switchValue = false;

  doSomething() {
    print("Username: $username");
    print("Password: $password");
    print("");
    print("Switch: $switchValue");

    print("");
  }
}

class MyAppPages extends StatefulWidget {
  final LoginData loginData = new LoginData();
  @override
  State<StatefulWidget> createState() {
    return _MyLoginPage(loginData);
  }
}

class _MyLoginPage extends State<MyAppPages> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final LoginData loginData;
  var _context;

  /* Com o index em 0 o aplicativo começa com o plano de fundo azul e rosa*/
  int index = 0;
  int index1 = 0;

/* O index recebe 1 depois que o switch muda de estado*/
  int count = 1;

  @override
  _MyLoginPage(this.loginData);

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Container(
        child: Stack(children: <Widget>[
      SingleChildScrollView(
          child: Container(
        //para decorar a tela
        padding: EdgeInsets.only(left: 110, right: 110, top: 10, bottom: 100),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding:
                        EdgeInsets.only(left: 0, right: 100, top: 0, bottom: 0),
                    child: IconButton(
                        icon: Icon(Icons.info),
                        iconSize: 35,
                        tooltip: "Saiba mais sobre os desenvolvedores",
                        onPressed: () {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text("Desenvolvedores:"),
                                    content: Text(
                                        "@laribene - Larissa Benevides \n@leoponte - Leonardo Ponte"),
                                    elevation: 24.0);
                              },
                              barrierDismissible: true);
                        }))
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(color: Colors.white, width: 5)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Stack(children: <Widget>[
                      Image.asset(
                        'assets/images/logoredondo.png',
                        width: 130.0,
                        height: 130.0,
                      )
                    ]))),
            Row(children: [
              Column(
                children: [
                  Text("Cursinho",
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'mistral.ttf',
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  Text("Comunitário",
                      style: TextStyle(
                          fontFamily: 'britannic-bold.ttf',
                          fontSize: 31.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text("Pimentas",
                      style: TextStyle(
                          fontFamily: 'mistral-regular.ttf',
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black))
                ],
              )
            ]),
          ],
        ),
      )),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              //para decorar a tela
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 0), // Da caixinha branca
              child: Stack(children: <Widget>[
                Positioned(
                    top: 300.0,
                    bottom: 30.0,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      height: 340.0,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(fontSize: 20),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'Informe seu usuário',
                                  labelText: 'Usuário ',
                                  icon: Icon(Icons.person),
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                                // VALIDADOR
                                validator: (String inValue) {
                                  // Função anonima
                                  if (inValue.length == 0) {
                                    return "Por favor, insira usuário aqui";
                                  }
                                  return null;
                                },
                                //SALVAR
                                onSaved: (String inValue) =>
                                    loginData.username = inValue,
                              ),
                              //Mudar o tamanho da fonte da letra
                              //Text("\n"),
                              TextFormField(
                                obscureText: true,
                                style: TextStyle(fontSize: 20),

                                decoration: InputDecoration(
                                  hintText: 'Informe sua senha',
                                  labelText: 'Senha ',
                                  //textError styling
                                  icon: Icon(Icons.security),
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),

                                //VALIDADOR
                                validator: (String inValue) {
                                  if (inValue.length < 10) {
                                    return "Mínimo de 10 caracteres";
                                  }
                                  return null;
                                },
                                //SALVAR
                                onSaved: (String inValue) =>
                                    loginData.password = inValue,
                              ),

                              Text("\n"),
                              MaterialButton(
                                color: Colors.black,
                                child: Text("Login",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                onPressed: () {
                                  // Função anonima
                                  if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                    FocusScope.of(context).unfocus();
                                    loginData
                                        .doSomething(); //Guardar em um banco de dados por exemplo

                                    //formKey.currentState.reset();

                                    // coloca mensagem no final da tela quando login dá certo
                                    Navigator.push(
                                        _context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MyMainDrawer()));

                                    // Voltar ao seu estado inicial
                                  }
                                  // validar os valores do TextFormField
                                },
                              ),
                              // espaçamento do conteúdo
                              Text("\n"),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 140, right: 0, top: 0, bottom: 0),
                                child: GestureDetector(
                                    child: Text(
                                        "Não tem cadastro?\n Cadastre-se aqui!",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.black)),
                                    onTap: () {
                                      Navigator.push(
                                          _context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MyRegister()));
                                    }),
                              )
                            ],
                          )),
                    ))
              ])))
    ]));
  }
}
