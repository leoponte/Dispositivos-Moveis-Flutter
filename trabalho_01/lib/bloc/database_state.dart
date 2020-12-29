import 'package:trabalho_01/models/studies_models.dart';

abstract class DatabaseState {}

class UnAuthenticatedDatabaseState extends DatabaseState {}

class BookDatabaseState extends DatabaseState {
  List<Math> maths;
  BookDatabaseState(this.maths);
}
