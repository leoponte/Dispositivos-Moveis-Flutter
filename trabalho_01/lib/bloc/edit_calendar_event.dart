import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_01/firebase/database.dart';
import 'package:trabalho_01/firebase/event_firestore_service.dart';
import 'package:trabalho_01/models/event.dart';
import 'package:trabalho_01/views/maindrawer/calendar.dart';

class EditCalendarPage extends StatelessWidget {
  // This widget is the root of your application.
  final EventModel event;

  const EditCalendarPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Informações adicionais")
              .doc(getCurrentUserId())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else {
              return EditEventPage(
                event: event,
              );
            }
          },
        ));
  }
}

class EditEventPage extends StatefulWidget {
  final EventModel event;

  const EditEventPage({Key key, this.event}) : super(key: key);

  @override
  EditEventPageState createState() => EditEventPageState(event: event);
}

class EditEventPageState extends State<EditEventPage> {
  final EventModel event;

  EditEventPageState({Key key, this.event});

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _aula;
  TextEditingController _descricao;
  DateTime _eventDate;
  TimeOfDay _time;
  var papel;
  var nome;
  int sala;

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;

  @override
  void initState() {
    super.initState();
    _aula =
        TextEditingController(text: event != null ? event.aula : event.aula);
    _descricao = TextEditingController(
        text: event != null ? event.descricao : event.descricao);
    _eventDate = event.eventDate;
    _time = TimeOfDay(
        hour: int.parse(event.hora.split(":")[0]),
        minute: int.parse(event.hora.split(":")[1]));

    processing = false;
    setState(() {
      sala = event.sala;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar aula"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyCalendar())),
        ),
      ),
      key: _key,
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _aula,
                  validator: (value) =>
                      (value.isEmpty) ? "Preencha a disciplina da aula" : null,
                  style: style,
                  decoration: InputDecoration(
                      labelText: "Matéria da Aula. ex: Sociologia",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _descricao,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) =>
                      (value.isEmpty) ? "Preencha o subtema da matéria" : null,
                  style: style,
                  decoration: InputDecoration(
                      labelText: "Subtema da matéria",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text("Onde você dará aula? "),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Text("Salinha",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                      Radio(
                        value: 1,
                        activeColor: Colors.black,
                        groupValue:
                            sala, //direciona valor do conteúdo para variável do loginData
                        onChanged: (int inValue) {
                          setState(() {
                            sala = inValue;
                          });
                        },
                      ),
                      Text(" Salona",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                      Radio(
                        value: 2,
                        activeColor: Colors.black,
                        groupValue: sala,
                        onChanged: (int inValue) {
                          setState(() {
                            // propriedade de mudança de estado proporcionada pelo StatefulWidget
                            sala = inValue;
                          });
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 10.0),
              ListTile(
                title: Text("Data (DD-MM-AAAA)"),
                subtitle: Text(
                    "${_eventDate.day} - ${_eventDate.month} - ${_eventDate.year}"),
                onTap: () async {
                  DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: _eventDate,
                      firstDate: DateTime(_eventDate.year - 5),
                      lastDate: DateTime(_eventDate.year + 5));
                  if (picked != null) {
                    setState(() {
                      _eventDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 10.0),
              ListTile(
                  title: Text("Horário da aula"),
                  subtitle: Text("Time: ${_time.hour}:${_time.minute}"),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: () async {
                    TimeOfDay pickTime = await showTimePicker(
                        context: context, initialTime: _time);
                    if (pickTime != null)
                      setState(() {
                        _time = pickTime;
                        print(_time);
                      });
                  }),
              processing
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Theme.of(context).primaryColor,
                        child: MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                processing = true;
                              });
                              if (event != null) {
                                await eventDBS.updateData(event.id, {
                                  "aula": _aula.text,
                                  "descricao": _descricao.text,
                                  "dia do evento": _eventDate,
                                  "hora do evento": _time.format(context),
                                  "papel": event.papel,
                                  "nome": event.nome,
                                  "sala": sala,
                                });
                              } else {
                                await eventDBS.createItem(EventModel(
                                  aula: _aula.text,
                                  descricao: _descricao.text,
                                  eventDate: _eventDate,
                                  hora: _time.format(context),
                                  papel: papel,
                                  nome: nome,
                                  sala: sala,
                                  idUser: getCurrentUserId(),
                                ));
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyCalendar()));
                              //Navigator.pop(context);
                              setState(() {
                                processing = false;
                              });
                            }
                          },
                          child: Text(
                            "Save",
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aula.dispose();
    _descricao.dispose();
    super.dispose();
  }
}
