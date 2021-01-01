import 'package:flutter/material.dart';
import 'package:trabalho_01/models/event.dart';
import 'package:trabalho_01/views/maindrawer/calendar.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sala;
    if (event.sala == 1)
      sala = "Salinha";
    else if (event.sala == 2) sala = "Salona";
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações da Aula"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyCalendar())),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
                child: Container(
              padding: EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
              child: Column(children: [
                Text(
                  "Aula de " + event.aula,
                  style: Theme.of(context).textTheme.display1,
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text("Subtema da aula: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(event.descricao),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      "A aula será ministrada na ",
                    ),
                    Text(sala,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(event.papel,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(" que dará aula: "),
                    Text(event.nome,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 20.0)
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
