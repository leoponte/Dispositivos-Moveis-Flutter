import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trabalho_01/firebase/calendar.dart';

import 'package:trabalho_01/firebase/functions.dart';

import 'package:trabalho_01/models/calendar_models.dart';

import 'package:trabalho_01/views/maindrawer/calendar/add_calendar.dart';
import 'package:trabalho_01/views/maindrawer/calendar/calendar_view.dart';
import 'package:trabalho_01/views/maindrawer/calendar/edit_calendar.dart';

import 'package:trabalho_01/views/maindrawer/maindrawer.dart';

//import 'main.dart';

class MyCalendar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyCalendarPage(),
        routes: {
          "add_event": (_) => AddCalendarPage(),
        });
  }
}

class MyCalendarPage extends StatefulWidget {
  final EventModel note;

  const MyCalendarPage({Key key, this.note}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPage> {
  var _context;
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _events = {};
    _selectedEvents = [];
  }

  Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> allEvents) {
    Map<DateTime, List<dynamic>> data = {};
    allEvents.forEach((event) {
      DateTime date = DateTime(
          event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              _context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyMainDrawer())),
        ),
      ),
      body: StreamBuilder<List<EventModel>>(
          stream: eventDBS.streamList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> allEvents = snapshot.data;
              if (allEvents.isNotEmpty) {
                _events = _groupEvents(allEvents);
              } else {
                _events = {};
                _selectedEvents = [];
              }
            }
            return SingleChildScrollView(
                child: Column(children: [
              Container(
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
                      Text("        Calendário",
                          style: TextStyle(
                              fontSize: 35.0,
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
                  ),
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TableCalendar(
                    events: _events,
                    initialCalendarFormat: CalendarFormat.month,
                    calendarStyle: CalendarStyle(
                        canEventMarkersOverflow: true,
                        todayColor: Colors.orange,
                        selectedColor: Theme.of(context).primaryColor,
                        todayStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white)),
                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      formatButtonTextStyle: TextStyle(color: Colors.white),
                      formatButtonShowsNext: false,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: (date, events, holidays) {
                      setState(() {
                        _selectedEvents = events;
                      });
                    },
                    builders: CalendarBuilders(
                      selectedDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      todayDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    calendarController: _controller,
                  ),
                  ..._selectedEvents.map((event) => Card(
                        child: ListTile(
                          title: Text(
                              "Aula de " + event.aula + " às " + event.hora),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EventDetailsPage(
                                          event: event,
                                        )));
                          },
                          trailing:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                  child: Icon(Icons.delete),
                                  onTap: () async {
                                    if (getCurrentUserId() == event.idUser) {
                                      return showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (contextA) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 50,
                                                bottom: 100),
                                            child: SingleChildScrollView(
                                                // Mostrar Politica de Privacidade
                                                child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0.0,
                                                  right: 0.0,
                                                  bottom: 0,
                                                  top: 200),
                                              child: AlertDialog(
                                                  title: Text(
                                                      "Você tem certeza que quer excluir essa aula? "),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text("Sim"),
                                                      onPressed: () {
                                                        print(event.id);

                                                        eventDBS.removeItem(
                                                            event.id);
                                                        Navigator.of(contextA)
                                                            .pop();
                                                        //Queria só recarregar a página
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    MyCalendar()));
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text("Não"),
                                                      onPressed: () {
                                                        // Faça algo
                                                        Navigator.of(contextA)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                  elevation: 24.0),
                                            )),
                                          );
                                        },
                                        //barrierDismissible: true
                                      );
                                    } else {
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                title: Row(children: [
                                              Icon(MaterialCommunityIcons.lock,
                                                  size: 20),
                                              Text("  Não permitido excluir!"),
                                            ]));
                                          });
                                    }
                                  }),
                            ),
                            Text("          "),
                            GestureDetector(
                                child: Icon(Icons.edit),
                                onTap: () {
                                  if (getCurrentUserId() == event.idUser) {
                                    //Queria só recarregar a página
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => EditCalendarPage(
                                                  event: event,
                                                )));
                                  } else {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              title: Row(children: [
                                            Icon(MaterialCommunityIcons.lock,
                                                size: 20),
                                            Text("  Não permitido editar!"),
                                          ]));
                                        });
                                  }
                                }),
                          ]),
                        ),
                      )),
                ],
              ),
            ]));
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'add_event'),
      ),
    );
  }
}
