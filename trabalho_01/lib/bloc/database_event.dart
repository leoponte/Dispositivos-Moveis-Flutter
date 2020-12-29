import 'package:trabalho_01/models/studies_models.dart';

abstract class DatabaseEvent {}

class UpdateDatabase extends DatabaseEvent {
  String mathId;
  bool matBasica1;
  bool matBasica2;
  bool matBasica3;
  bool matBasica4;
  bool matBasica5;
  bool matBasica6;
  bool matBasica7;
  bool matBasica8;
  UpdateDatabase(this.mathId,
      [this.matBasica1,
      this.matBasica2,
      this.matBasica3,
      this.matBasica4,
      this.matBasica5,
      this.matBasica6,
      this.matBasica7,
      this.matBasica8]);
}

class AddDatabase extends DatabaseEvent {
  bool matBasica1;
  bool matBasica2;
  bool matBasica3;
  bool matBasica4;
  bool matBasica5;
  bool matBasica6;
  bool matBasica7;
  bool matBasica8;

  AddDatabase(
      {this.matBasica1,
      this.matBasica2,
      this.matBasica3,
      this.matBasica4,
      this.matBasica5,
      this.matBasica6,
      this.matBasica7,
      this.matBasica8});
}

/*class DeleteDatabase extends DatabaseEvent {
  String docId;
  DeleteDatabase({this.docId});
}*/

class ReceivedNewList extends DatabaseEvent {
  List<Math> maths;
  ReceivedNewList(this.maths);
}
