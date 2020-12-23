import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho_01/models/book_models.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference mathCollections =
      FirebaseFirestore.instance.collection("math");

  addBook(
      bool matBasica1,
      bool matBasica2,
      bool matBasica3,
      bool matBasica4,
      bool matBasica5,
      bool matBasica6,
      bool matBasica7,
      bool matBasica8) async {
    return await mathCollections.doc(uid).collection("matematica").add({
      "matBasica1": matBasica1,
      "matBasica2": matBasica2,
      "matBasica3": matBasica3,
      "matBasica4": matBasica4,
      "matBasica5": matBasica5,
      "matBasica6": matBasica6,
      "matBasica7": matBasica7,
      "matBasica8": matBasica8,
    });
  }

  /*removeBook(String bookId) async {
    return await mathCollections
        .doc(uid)
        .collection("meus_livros")
        .doc(bookId)
        .delete();
  }*/

  updateBook(
      String mathId,
      bool matBasica1,
      bool matBasica2,
      bool matBasica3,
      bool matBasica4,
      bool matBasica5,
      bool matBasica6,
      bool matBasica7,
      bool matBasica8) async {
    return await mathCollections
        .doc(uid)
        .collection("matematica")
        .doc(mathId)
        .update({
      "matBasica1": matBasica1,
      "matBasica2": matBasica2,
      "matBasica3": matBasica3,
      "matBasica4": matBasica4,
      "matBasica5": matBasica5,
      "matBasica6": matBasica6,
      "matBasica7": matBasica7,
      "matBasica8": matBasica8,
    });
  }

  Stream<List<Math>> get books {
    return mathCollections
        .doc(uid)
        .collection("meus_livros")
        .snapshots()
        .map(_bookListFromSnapshot);
  }

  List<Math> _bookListFromSnapshot(QuerySnapshot snapshot) {
    List<Math> books = List();
    for (var doc in snapshot.docs) {
      books.add(Math.fromMap(doc.id, doc.data()));
    }
    return books;
  }
}
