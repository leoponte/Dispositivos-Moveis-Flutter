import 'package:firebase_helpers/firebase_helpers.dart';

class EventModel extends DatabaseItem {
  final String id;
  final String idUser;
  final String aula;
  final String descricao;
  final DateTime eventDate;
  final String papel;
  final String nome;
  final int sala;

  EventModel(
      {this.id,
      this.idUser,
      this.aula,
      this.descricao,
      this.eventDate,
      this.papel,
      this.nome,
      this.sala})
      : super(id);

  factory EventModel.fromMap(Map data) {
    return EventModel(
        //id: data['id'],
        idUser: data['idUser'],
        aula: data['aula'],
        descricao: data['descricao'],
        eventDate: data['dia do evento'],
        papel: data['papel'],
        nome: data['nome'],
        sala: data['sala']);
  }

  factory EventModel.fromDS(String id, Map<String, dynamic> data) {
    return EventModel(
        id: id,
        idUser: data['idUser'],
        aula: data['aula'],
        descricao: data['descricao'],
        eventDate: data['dia do evento'].toDate(),
        papel: data['papel'],
        nome: data['nome'],
        sala: data['sala']);
  }

  Map<String, dynamic> toMap() {
    return {
      "idUser": idUser,
      "aula": aula,
      "descricao": descricao,
      "dia do evento": eventDate,
      "papel": papel,
      "nome": nome,
      "sala": sala,
      //"id": id,
    };
  }
}
