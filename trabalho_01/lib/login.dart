import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_01/bloc/auth_event.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trabalho_01/register.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/auth_bloc.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyAppCreate();
  }
}

class _MyAppCreate extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppPages(),
    );
  }
}

class MyAppPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLoginPage();
  }
}

class _MyLoginPage extends State<MyAppPages> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  LoginUser registerData = LoginUser();

/* O index recebe 1 depois que o switch muda de estado*/
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Stack(children: <Widget>[
        SingleChildScrollView(
            child: Container(
          //parte do cursinho comunitário pimentas
          padding: EdgeInsets.only(left: 110, right: 110, top: 10, bottom: 100),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      // Utilizado para informar quem são os desenvolvedores
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
                                      content: Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                    MaterialCommunityIcons
                                                        .github_circle,
                                                    size: 30),
                                                InkWell(
                                                    child: Text(
                                                        ' Leonardo Ponte',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color: Colors.black,
                                                            fontSize: 20)),
                                                    onTap: () =>
                                                        abrirUrlLeonardo()),
                                              ],
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              children: [
                                                Icon(
                                                  MaterialCommunityIcons
                                                      .github_circle,
                                                  size: 30,
                                                ),
                                                InkWell(
                                                    child: Text(
                                                        ' Larissa Benevides',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color: Colors.black,
                                                            fontSize: 20)),
                                                    onTap: () =>
                                                        abrirUrlLarissa()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      elevation: 24.0);
                                },
                                barrierDismissible: true);
                          }))
                ],
              ),
              Container(
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
                //Caixa branca para colocar usuário e senha.
                padding:
                    EdgeInsets.only(left: 22, right: 10, top: 10, bottom: 0),
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
                        child: loginFormulario(),
                      )),
                ])))
      ])),
    );
  }

  abrirUrlLeonardo() async {
    const url = 'https://github.com/leoponte';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  abrirUrlLarissa() async {
    const url = 'https://github.com/Laribene';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget loginFormulario() {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Informe seu e-mail',
                labelText: 'E-mail ',
                labelStyle: TextStyle(color: Colors.black),
                icon: Icon(Icons.person, color: Colors.black),
                errorStyle: TextStyle(color: Colors.red, fontSize: 15),
              ),
              // VALIDADOR
              validator: (String inValue) {
                // Função anonima
                if (inValue.length == 0) {
                  return "Por favor, insira e-mail aqui";
                }
                return null;
              },
              //SALVAR
              onSaved: (String inValue) => registerData.username = inValue,
            ),

            TextFormField(
              obscureText: true,
              style: TextStyle(fontSize: 20),

              decoration: InputDecoration(
                hintText: 'Informe sua senha',
                labelText: 'Senha ',
                labelStyle: TextStyle(color: Colors.black),
                //textError styling
                icon: Icon(Icons.security, color: Colors.black),
                errorStyle: TextStyle(color: Colors.red, fontSize: 15),
              ),

              //VALIDADOR
              validator: (String inValue) {
                if (inValue.length < 10) {
                  return "Mínimo de 10 caracteres";
                }
                return null;
              },
              //SALVAR
              onSaved: (String inValue) => registerData.password = inValue,
            ),

            Text("\n"),
            Container(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.black,
                  child: Text("Entrar",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    // Função anonima
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      FocusScope.of(context).unfocus();

                      BlocProvider.of<AuthBloc>(context).add(registerData);
                    }
                  },
                ),
              ),
            ),
            // espaçamento do conteúdo
            Text("\n"),
            Container(
              padding: EdgeInsets.only(left: 140, right: 0, top: 0, bottom: 0),
              child: GestureDetector(
                  child: Text("Não tem cadastro?\n Cadastre-se aqui!",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyRegister()));
                  }),
            )
          ],
        ));
  }
}
