import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_01/bloc/auth_bloc.dart';
import 'package:trabalho_01/bloc/auth_event.dart';
import 'package:trabalho_01/login.dart';
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
/*
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
*/

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  RegisterUser registerData = RegisterUser();
  bool _obscureText = true;
  // Valor default para o dropdown
  //String dropdownValue = 'Salona';
  // Deixar visivel a senha.
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // this._context = context;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(context,
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
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.person, color: Colors.black),
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
                      onSaved: (String inValue) => registerData.name = inValue,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Informe seu e-mail',
                        labelText: 'E-mail ',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.mail, color: Colors.black),
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
                      onSaved: (String inValue) =>
                          registerData.username = inValue,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        labelText: 'Senha ',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.security, color: Colors.black),
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
                      onSaved: (String inValue) =>
                          registerData.password = inValue,
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
                              fontSize: 23.0,
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
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  Radio(
                    value: 1,
                    activeColor: Colors.black,
                    groupValue: registerData
                        .role, //direciona valor do conteúdo para variável do loginData
                    onChanged: (int inValue) {
                      setState(() {
                        registerData.role = inValue;
                      });
                    },
                  ),
                  Text(" Aluno",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  Radio(
                    value: 2,
                    activeColor: Colors.black,
                    groupValue: registerData.role,
                    onChanged: (int inValue) {
                      setState(() {
                        // propriedade de mudança de estado proporcionada pelo StatefulWidget
                        registerData.role = inValue;
                      });
                    },
                  ),
                ],
              )),
          Text("\n\n"),
          Container(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 20),
            width: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Colors.black,
                child: Text("Cadastrar",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                onPressed: () {
                  // Função anonima
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    FocusScope.of(context)
                        .unfocus(); //Faz descer o teclado após apertar o botão
                    BlocProvider.of<AuthBloc>(context).add(registerData);
                    BlocProvider.of<AuthBloc>(context).add(
                        Logout()); // GAMBIARRA PARA PARAR NA TELA DE LOGIN (PERGUNTAR PARA O PROFESSOR)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyApp()));
                  }
                  // validar os valores do TextFormField
                },
              ),
            ),
          ),
        ])));
  }
}
