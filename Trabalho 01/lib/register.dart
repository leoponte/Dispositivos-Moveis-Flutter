import 'package:flutter/material.dart';
import 'main.dart';

class MyRegister extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class LoginData {
  String nome = "";
  String username = "";
  String password = "";
  String email = "";
  var checkboxValue = false;
  var checkboxValue1 = false;

  var switchValue = false;
  var radioValue1 = 1;

  doSomething() {
    print("Username: $nome");
    print("Username: $username");
    print("Password: $password");
    print("");
    print("CheckBox: $checkboxValue");
    print("Switch: $switchValue");
    print("Radio: $radioValue1");
    print("");
  }
}

class MyHomePage extends StatefulWidget {
  final LoginData loginData = new LoginData();
  @override
  State<StatefulWidget> createState() => _MyHomePageState(loginData);
}

class _MyHomePageState extends State<MyHomePage> {
  var _context;
  final LoginData loginData;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  _MyHomePageState(this.loginData);

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(_context,
                MaterialPageRoute(builder: (BuildContext context) => MyApp())),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            //para decorar a tela
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 100),
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
                  Text(" Cadastre-se",
                      //textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'CourierPrime-Regular.ttf',
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
              padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              child: Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      style: TextStyle(fontSize: 25),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Informe seu nome',
                        labelText: 'Nome ',
                        icon: Icon(Icons.person),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      // VALIDADOR
                      validator: (String inValue) {
                        // Função anonima
                        if (inValue.length == 0) {
                          return "Por favor, insira seu nome aqui";
                        }
                        return null;
                      },
                      //SALVAR
                      onSaved: (String inValue) => loginData.nome = inValue,
                    ), //Mudar o tamanho da fonte da letra
                    TextFormField(
                      style: TextStyle(fontSize: 25),
                      //keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Informe seu usuário',
                        labelText: 'Usuário ',
                        icon: Icon(Icons.person),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
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
                      onSaved: (String inValue) => loginData.username = inValue,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 25),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Informe seu e-mail',
                        labelText: 'E-mail ',
                        icon: Icon(Icons.mail),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      // VALIDADOR
                      validator: (String inValue) {
                        // Função anonima
                        if (inValue.length == 0) {
                          return "Por favor, insira seu email";
                        }
                        return null;
                      },
                      //SALVAR
                      onSaved: (String inValue) => loginData.email = inValue,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      style: TextStyle(fontSize: 25),
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        labelText: 'Senha ',
                        //border: InputBorder.none,
                        //textError styling
                        icon: Icon(Icons.security),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        suffixIcon: InkWell(
                          onTap: _toggle,
                          child: Icon(
                            _obscureText
                                ? Icons.enhanced_encryption
                                : Icons.no_encryption,
                            size: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      //VALIDADOR
                      validator: (String inValue) {
                        if (inValue.length < 10) {
                          return "Mínimo de 10 caracteres";
                        }
                        return null;
                      },
                      //SALVAR
                      onSaved: (String inValue) => loginData.password = inValue,
                    ),
                    Row(
                      children: [
                        Text("Professor",
                            style: TextStyle(
                                fontFamily:
                                    'CourierPrime-Bold', // Fonte exportada
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        Radio(
                          value: 1,
                          groupValue: loginData
                              .radioValue1, //direciona valor do conteúdo para variável do loginData
                          onChanged: (int inValue) {
                            setState(() {
                              loginData.radioValue1 = inValue;
                            });
                          },
                        ),
                        Text("Aluno",
                            style: TextStyle(
                                fontFamily:
                                    'CourierPrime-Bold', // Fonte exportada
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        Radio(
                          value: 2,
                          groupValue: loginData.radioValue1,
                          onChanged: (int inValue) {
                            setState(() {
                              // propriedade de mudança de estado proporcionada pelo StatefulWidget
                              loginData.radioValue1 = inValue;
                            });
                          },
                        ),
                      ],
                    ),
                    RaisedButton(
                      child: Text("Login", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        // Função anonima
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          FocusScope.of(context)
                              .unfocus(); //Faz descer o teclado após apertar o botão
                          loginData
                              .doSomething(); //Guardar em um banco de dados por exemplo

                          formKey.currentState
                              .reset(); // Voltar ao seu estado inicial
                        }
                        // validar os valores do TextFormField
                      },
                    ),
                  ]))),
        ])));
  }
}
