import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_01/bloc/auth_bloc.dart';
import 'package:trabalho_01/bloc/auth_event.dart';

import 'package:trabalho_01/login.dart';

import 'bloc/auth_bloc.dart';

class MyRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  RegisterUser registerData = RegisterUser();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    FocusScope.of(context).unfocus();
                    return showDialog(
                        context: context,
                        builder: (contextA) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 50, bottom: 100),
                            child: SingleChildScrollView(
                                // Mostrar Politica de Privacidade
                                child: AlertDialog(
                                    title: Text("Politica de Privacidade"),
                                    content: Text(
                                        " A sua privacidade é importante para nós.\n  É política do Cursinho Comunitário Pimentas respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site Cursinho Comunitário Pimentas, e outros sites que possuímos e operamos.\n  Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço.\n Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.\n Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado.\n Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.\n Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.\n  O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade.\n Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.\n O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contato conosco.\n Esperemos que esteja esclarecido e, como mencionado anteriormente, se houver algo que você não tem certeza se precisa ou não, geralmente é mais seguro deixar os cookies ativados, caso interaja com um dos recursos que você usa em nosso site.\n  Esta política é efetiva a partir de November/2020."),
                                    actions: [
                                      FlatButton(
                                        child: Text("Aceitar"),
                                        onPressed: () {
                                          Navigator.of(contextA).pop();

                                          BlocProvider.of<AuthBloc>(context)
                                              .add(registerData);

                                          BlocProvider.of<AuthBloc>(context)
                                              .add(Logout());
                                          // GAMBIARRA PARA PARAR NA TELA DE LOGIN (PERGUNTAR PARA O PROFESSOR)
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          MyApp()));
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Discordar"),
                                        onPressed: () {
                                          // Faça algo
                                          Navigator.of(contextA).pop();
                                        },
                                      ),
                                    ],
                                    elevation: 24.0)),
                          );
                        },
                        barrierDismissible: true);

                    //Faz descer o teclado após apertar o botão

                  }
                  // validar os valores do TextFormField
                },
              ),
            ),
          ),
        ])));
  }
}
