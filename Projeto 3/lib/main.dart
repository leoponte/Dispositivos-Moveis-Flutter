import 'package:flutter/material.dart';
import 'package:tutorial/register.dart';
import 'package:tutorial/database_helper.dart';

void main() {
  runApp(MyRegister());
}

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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  var _context;
  LoginData loginData = new LoginData("", "", "", "", 1, "");

  bool _obscureText = true;
  // Valor default para o dropdown
  String dropdownValue = "Salona";
  // Deixar visivel a senha.
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
        appBar: AppBar(),
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
                      onSaved: (String inValue) => loginData.name = inValue,
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
                    Text("\n"),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child:
                                    Text("\n                   Quem é você?\n",
                                        style: TextStyle(
                                            // Fonte exportada
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          left: 57, right: 5, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          getRadioButton(1, "Aluno"),
                          getRadioButton(2, "Professor"),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                    "\n     De qual grupo você pertence?\n",
                                    style: TextStyle(
                                        // Fonte exportada
                                        fontSize: 23.0,
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
                          setState(
                            () => dropdownValue = newValue,
                          );
                          setState(() => loginData.classroom = dropdownValue);
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
                          child: Text(value, style: TextStyle(fontSize: 20.0)),
                        );
                      }).toList(),
                    ),
                    Text("\n"),
                    Container(
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 20),
                      width: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          color: Colors.black,
                          child: Text("Salvar no Banco",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                          onPressed: () {
                            // Função anonima
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              FocusScope.of(context)
                                  .unfocus(); //Faz descer o teclado após apertar o botão
                              _saveOnDatabase(); //salvar no banco de dados local
                            }
                            // validar os valores do TextFormField
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 20),
                      width: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          color: Colors.black,
                          child: Text("Obter do Banco",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                          onPressed: () {
                            // Função anonima
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              FocusScope.of(context)
                                  .unfocus(); //Faz descer o teclado após apertar o botão
                              //DatabaseHelper.helper.getNoteMapList();
                              DatabaseHelper.helper.getNoteMapList();
                            }
                            // validar os valores do TextFormField
                          },
                        ),
                      ),
                    ),
                  ]))),
        ])));
  }

  Widget getRadioButton(int radioValue, String role) {
    return Row(
      children: [
        Radio(
          groupValue: loginData.role,
          value: radioValue,
          onChanged: (int value) {
            setState(() {
              loginData.role = value;
            });
          },
        ),
        Text(role,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.black))
      ],
    );
  }

  _saveOnDatabase() async {
    var helper = DatabaseHelper.helper;
    await helper.insertNote(loginData);

    helper.getCount().then((valor) {
      print("Valor = $valor");
    });
  }
}
