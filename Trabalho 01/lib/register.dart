import 'package:flutter/material.dart';
import 'main.dart';

class MyRegister extends StatelessWidget {
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
  // Valor default para o dropdown
  String dropdownValue = 'Salona';
  // Deixar visivel a senha.
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
                  Text(" Cadastre-se",
                      style: TextStyle(
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
                      style: TextStyle(fontSize: 20),
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
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 20),

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
                      style: TextStyle(fontSize: 20),
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
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        labelText: 'Senha ',
                        icon: Icon(Icons.security),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        suffixIcon: InkWell(
                          onTap: _toggle,
                          // Escurecer e mostrar senha
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
                  ]))),
          Text("\n"),
          Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text("\n                       Quem é você?\n",
                          style: TextStyle(
                              // Fonte exportada
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))
                ],
              )),
          Container(
              padding: EdgeInsets.only(left: 80, right: 5, top: 0, bottom: 0),
              child: Row(
                children: [
                  Text("Professor",
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  Radio(
                    value: 1,
                    activeColor: Colors.black,
                    groupValue: loginData
                        .radioValue1, //direciona valor do conteúdo para variável do loginData
                    onChanged: (int inValue) {
                      setState(() {
                        loginData.radioValue1 = inValue;
                      });
                    },
                  ),
                  Text(" Aluno",
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  Radio(
                    value: 2,
                    activeColor: Colors.black,
                    groupValue: loginData.radioValue1,
                    onChanged: (int inValue) {
                      setState(() {
                        // propriedade de mudança de estado proporcionada pelo StatefulWidget
                        loginData.radioValue1 = inValue;
                      });
                    },
                  ),
                ],
              )),
          Container(
              decoration: BoxDecoration(
                color: Colors.red,
                //borderRadius: BorderRadius.circular(50),
                //border: Border.all(color: Colors.white, width: 10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text("\n          De qual grupo você pertence?\n",
                          style: TextStyle(
                              // Fonte exportada
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))
                ],
              )),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 35,
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (String newValue) {
              setState(() {
                FocusScope.of(context).requestFocus(
                    FocusNode()); //Para parar de abrir o teclado quando clicado no Dropdown
                setState(() => dropdownValue = newValue);
              });
            },
            items: <String>[
              'Salona',
              'Salinha',
              'Grupo 3',
              'Nenhuma das opções'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 23.0)),
              );
            }).toList(),
          ),
          Text("\n"),
          MaterialButton(
            color: Colors.black,
            child: Text("Cadastrar",
                style: TextStyle(fontSize: 27, color: Colors.white)),
            onPressed: () {
              // Função anonima
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                FocusScope.of(context)
                    .unfocus(); //Faz descer o teclado após apertar o botão
                loginData
                    .doSomething(); //Guardar em um banco de dados por exemplo

                Navigator.push(
                    _context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()));
              }
              // validar os valores do TextFormField
            },
          ),
        ])));
  }
}
