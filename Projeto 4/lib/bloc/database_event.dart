import 'package:projeto_4/models/book_models.dart';

abstract class DatabaseEvent {}

class UpdateDatabase extends DatabaseEvent {
  String bookId;
  String titulo;
  String autor;
  int nota;

  UpdateDatabase({this.bookId, this.titulo, this.autor, this.nota});
}

class AddDatabase extends DatabaseEvent {
  String titulo;
  String autor;
  int nota;

  AddDatabase({this.titulo, this.autor, this.nota});
}

class DeleteDatabase extends DatabaseEvent {
  String docId;
  DeleteDatabase({this.docId});
}

class ReceivedNewList extends DatabaseEvent {
  List<Book> books;
  ReceivedNewList(this.books);
}
