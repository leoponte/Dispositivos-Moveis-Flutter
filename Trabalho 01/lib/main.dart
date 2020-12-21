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
      //darkTheme: ThemeData.dark(),
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
                                    content: Text(
                                        "@laribene - Larissa Benevides \n@leoponte - Leonardo Ponte"),
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
              padding: EdgeInsets.only(left: 22, right: 10, top: 10, bottom: 0),
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
                                  hintText: 'Informe seu e-mail',
                                  labelText: 'E-mail ',
                                  labelStyle: TextStyle(color: Colors.black),
                                  icon: Icon(Icons.person, color: Colors.black),
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15),
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
                                onSaved: (String inValue) =>
                                    loginData.username = inValue,
                              ),

                              TextFormField(
                                obscureText: true,
                                style: TextStyle(fontSize: 20),

                                decoration: InputDecoration(
                                  hintText: 'Informe sua senha',
                                  labelText: 'Senha ',
                                  labelStyle: TextStyle(color: Colors.black),
                                  //textError styling
                                  icon:
                                      Icon(Icons.security, color: Colors.black),
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
                              Container(
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: FlatButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    color: Colors.black,
                                    child: Text("Entrar",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                    onPressed: () {
                                      // Função anonima
                                      if (formKey.currentState.validate()) {
                                        formKey.currentState.save();
                                        FocusScope.of(context).unfocus();
                                        loginData
                                            .doSomething(); //Guardar em um banco de dados por exemplo
                                        return showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 50,
                                                    bottom: 100),
                                                child: SingleChildScrollView(
                                                    // Mostrar Politica de Privacidade
                                                    child: AlertDialog(
                                                        title: Text(
                                                            "Politica de Privacidade"),
                                                        content: Text(
                                                            " A sua privacidade é importante para nós.\n  É política do Cursinho Comunitário Pimentas respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site Cursinho Comunitário Pimentas, e outros sites que possuímos e operamos.\n  Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço.\n Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.\n Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado.\n Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.\n Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.\n  O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade.\n Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.\n O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contato conosco.\n Esperemos que esteja esclarecido e, como mencionado anteriormente, se houver algo que você não tem certeza se precisa ou não, geralmente é mais seguro deixar os cookies ativados, caso interaja com um dos recursos que você usa em nosso site.\n  Esta política é efetiva a partir de November/2020."),
                                                        actions: [
                                                          FlatButton(
                                                            child:
                                                                Text("Aceitar"),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.push(
                                                                  _context,
                                                                  MaterialPageRoute(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          MyMainDrawer()));
                                                            },
                                                          ),
                                                          FlatButton(
                                                            child: Text(
                                                                "Discordar"),
                                                            onPressed: () {
                                                              // Faça algo
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                        elevation: 24.0)),
                                              );
                                            },
                                            barrierDismissible: true);
                                      }
                                    },
                                  ),
                                ),
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
