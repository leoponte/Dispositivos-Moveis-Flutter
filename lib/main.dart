import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, //Coloquei a cor como azul.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Trabalho 1 - Dispositivos Móveis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true, // Centralizar o titulo do app
              title: Text(widget.title),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.android)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(child: gerarSintaxeViewLarissa()),
                Center(child: gerarSintaxeViewLeonardo()),
                Center(child: gerarSintaxeViewCursinho()),
              ],
            )));
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
                        top: 40,
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

Widget gerarSintaxeViewCursinho() {
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
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0), //Para deixar a imagem a esquerda
                    child: Image.asset(
                      'assets/images/cursinho.png',
                      width: 390.0,
                      height: 200.0,
                    )),
              ],
            ),
            Row(
              children: [
                Text('   '),
                Flexible(
                    child: Column(
                  children: [
                    Text("Tema",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                        "Aplicativo para planejamento e organização de cronograma de aulas e estudos para o Cursinho Comunitário Pimentas.\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 23.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    Text("Informações armazenadas pelo usuário",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                        "Cadastro de perfil pessoal - Nome, email, senha, qual sala o usuário se encontra.\nCadastro de aulas - Feita pelo professor.\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 23.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    Text("Serviços web que serão usados",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                        "- API de calendário\n- Firebase  para guardar informações\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 23.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    Text("Informações serão gravadas no servidor\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'CourierPrime-Bold',
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
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
