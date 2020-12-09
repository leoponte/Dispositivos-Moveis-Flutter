import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:projeto_4/bloc/database_event.dart';
import 'package:projeto_4/bloc/database_state.dart';
import 'package:projeto_4/firebase/database.dart';
import 'package:projeto_4/models/book_models.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseService _databaseService;
  StreamSubscription _databaseSubscription;

  DatabaseBloc(String uid) : super(UnAuthenticatedDatabaseState()) {
    _databaseService = DatabaseService(uid: uid);
    _databaseSubscription = _databaseService.books.listen((List<Book> event) {
      add(ReceivedNewList(event));
    });
  }

  @override
  Stream<DatabaseState> mapEventToState(DatabaseEvent event) async* {
    if (event is AddDatabase) {
      _databaseService.addBook(event.titulo, event.autor, event.nota);
    } else if (event is DeleteDatabase) {
      _databaseService.removeBook(event.docId);
    } else if (event is UpdateDatabase) {
      _databaseService.updateBook(
          event.bookId, event.titulo, event.autor, event.nota);
    } else if (event is ReceivedNewList) {
      yield BookDatabaseState(event.books);
    }
  }

  @override
  Future<void> close() {
    _databaseSubscription.cancel();
    return super.close();
  }
}
