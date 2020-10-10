import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstBottomNavigationBar());
}

class MyFirstBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyBottomNavigationBar(); //Ele vai criar a classe do objeto estado
  }
}

class _MyBottomNavigationBar extends State<MyFirstBottomNavigationBar> {
  int _currentPage; // Sabe qual página está
  var _pages;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pages = [
      gerarSintaxeViewLarissa(),
      gerarSintaxeViewLeonardo(),
      MyFirstFormWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Nosso primeiro BottomNavigationBar",
        home: Scaffold(
          body: Center(child: _pages.elementAt(_currentPage)),
          //appBar: AppBar(title: Text("Nosso primeiro BottomNavigationBar")),
          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_pin), title: Text("Larissa")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_pin), title: Text("Leonardo")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.receipt), title: Text("Usuário")),
              ],
              fixedColor: Colors.white,
              backgroundColor:
                  Colors.blue, //deixa o fundo do bottomnavigation azull
              currentIndex: _currentPage,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              }),
        ));
  }
}

Widget gerarSintaxeViewLarissa() {
  return Center(
    child: Container(
      //para decorar a tela
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Fazer as cores gradientes na tela
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.pink],
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                        left: 9.0,
                        right: 10.0,
                        top: 70,
                        bottom: 40), //Para deixar a imagem a esquerda
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        border: Border.all(color: Colors.black, width: 4)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(85),
                        child: Image.asset(
                          'assets/images/lari.jpg',
                          width: 160.0,
                          height: 160.0,
                        ))),
                Flexible(
                  // Fazer com o nome não saia da tela
                  child: Text('Larissa B. Vieira     200805',
                      style: TextStyle(
                          fontFamily: 'CourierPrime-Bold', // Fonte exportada
                          fontSize: 33.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                )
              ],
            ),
            Row(
              children: [
                Text('   '),
                Flexible(
                    child: Column(
                  children: [
                    Text("Acadêmica",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                        "Graduanda em Sistemas de Informação, atualmente no 6º semestre.\n",
                        textAlign: TextAlign.justify, // Justificando o Texto
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 23.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    Text("Profissional",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                        "Trabalho atualmente na Protega Security Consulting estagiando na área de Segurança da Informação.\n",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 23.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    Text("Pessoal",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                        "Gosto de programar, embora precise praticar mais.\nNo meu tempo livre eu acabo estudando assuntos relacionados com Segurança da Informação.\nGosto bastante de música eletrônica e atualmente não estou praticando nenhum esporte, embora goste bastante de futebol.\n",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 23.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ],
                )),
                Text('  ')
              ],
            ),
          ]),
        ),
      ),
    ),
  );
}

Widget gerarSintaxeViewLeonardo() {
  return Center(
    child: Container(
      //para decorar a tela
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Fazer as cores gradientes na tela
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.pink],
        ),
      ),
      child: SingleChildScrollView(
        //Deixa tela adaptável ao conteúdo, permitindo scroll
        child: Center(
          child: Column(
            children: [
              Column(
                //Insere a foto
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 90,
                          bottom: 25), //Para deixar a imagem centralizada
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(85), //Arredondando foto
                          child: Image.asset(
                            'assets/images/leo.jpg',
                            width: 160.0,
                            height: 160.0,
                          ))),
                ],
              ),
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // centralizando textos
                children: [
                  Text('Leonardo A. da Ponte',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('220007\n\n',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                      'Cursando o sexto semestre do curso de Sistemas de Informação, comecei um estágio no Banco Itaú ainda recentemente, e gosto de trabalhar com bancos de dados e programação em geral.\nAinda tenho muito a avançar no mercado como um desenvolvedor, mas sei que, com as boas pessoas que tenho ao meu lado, o aprendizado só tem a agregar a todos cada dia mais.\n\n',
                      textAlign: TextAlign.center, //centraliza texto
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  Column(
                    children: [
                      Row(children: [
                        //Linha de caixinhas
                        Expanded(
                          //Define espaçamento igual entre as caixas
                          child: Container(
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Text("Música:\n\nFolk",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Text("Violão:\n\nPratico",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Text("Esportes:\n\nFutebol",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 29.9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      ])
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class LoginData {
  String username = "";
  String password = "";

  doSomething() {
    print("Username: $username");
    print("Password: $password");
    print("");
  }
}

class MyFirstFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey =
      new GlobalKey<FormState>(); // Final é pedido para Stateless Widget
  final LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Container(
      //para decorar a tela
      padding: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Fazer as cores gradientes na tela
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.pink],
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(fontSize: 25),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    errorStyle: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  // VALIDADOR
                  validator: (String inValue) {
                    // Função anonima
                    if (inValue.length == 0) {
                      return "Please enter username";
                    }
                    return null;
                  },
                  //SALVAR
                  onSaved: (String inValue) => loginData.username = inValue,
                ), //Mudar o tamanho da fonte da letra

                TextFormField(
                  obscureText: true,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    //textError styling
                    icon: Icon(Icons.security),
                    errorStyle: TextStyle(color: Colors.white, fontSize: 15),
                  ),

                  //VALIDADOR
                  validator: (String inValue) {
                    if (inValue.length < 10) {
                      return "Password maior do que 10";
                    }
                    return null;
                  },
                  //SALVAR
                  onSaved: (String inValue) => loginData.password = inValue,
                ),
                RaisedButton(
                  child: Text("Login", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    // Função anonima
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      loginData
                          .doSomething(); //Guardar em um banco de dados por exemplo
                      formKey.currentState
                          .reset(); // Voltar ao seu estado inicial
                    }
                    // validar os valores do TextFormField
                  },
                ),
              ],
            )),
      ),
    );
  }
}