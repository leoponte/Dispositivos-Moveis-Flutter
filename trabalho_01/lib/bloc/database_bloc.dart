import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trabalho_01/bloc/database_event.dart';
import 'package:trabalho_01/bloc/database_state.dart';
import 'package:trabalho_01/firebase/database.dart';
import 'package:trabalho_01/models/studies_models.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseService _databaseService;
  StreamSubscription _databaseSubscription;

  DatabaseBloc(String uid) : super(UnAuthenticatedDatabaseState()) {
    _databaseService = DatabaseService(uid: uid);
    _databaseSubscription = _databaseService.books.listen((List<Math> event) {
      add(ReceivedNewList(event));
    });
  }

  @override
  Stream<DatabaseState> mapEventToState(DatabaseEvent event) async* {
    if (event is AddDatabase) {
      _databaseService.addBookMatematica(
          // VER SE PRECISA MODIFICAR DEPOIS
          event.matBasica1,
          event.matBasica2,
          event.matBasica3,
          event.matBasica4,
          event.matBasica5,
          event.matBasica6,
          event.matBasica7,
          event.matBasica8);
      /* } else if (event is DeleteDatabase) {
      _databaseService.removeBook(event.docId);*/
    } else if (event is UpdateDatabase) {
      _databaseService.updateBook(
          event.mathId,
          event.matBasica1,
          event.matBasica2,
          event.matBasica3,
          event.matBasica4,
          event.matBasica5,
          event.matBasica6,
          event.matBasica7,
          event.matBasica8);
    } else if (event is ReceivedNewList) {
      yield BookDatabaseState(event.maths);
    }
  }

  @override
  Future<void> close() {
    _databaseSubscription.cancel();
    return super.close();
  }
}
