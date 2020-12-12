import 'package:projeto_4/models/book_models.dart';

abstract class DatabaseState {}

class UnAuthenticatedDatabaseState extends DatabaseState {}

class BookDatabaseState extends DatabaseState {
  List<Book> books;
  BookDatabaseState(this.books);
}
