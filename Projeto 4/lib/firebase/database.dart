import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_4/models/book_models.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference bookCollections =
      FirebaseFirestore.instance.collection("books");

  addBook(String titulo, String autor, int nota) async {
    return await bookCollections
        .doc(uid)
        .collection("meus_livros")
        .add({"titulo": titulo, "autor": autor, "nota": nota});
  }

  removeBook(String bookId) async {
    return await bookCollections
        .doc(uid)
        .collection("meus_livros")
        .doc(bookId)
        .delete();
  }

  updateBook(String bookId, String titulo, String autor, int nota) async {
    return await bookCollections
        .doc(uid)
        .collection("meus_livros")
        .doc(bookId)
        .update({"titulo": titulo, "autor": autor, "nota": nota});
  }

  Stream<List<Book>> get books {
    return bookCollections
        .doc(uid)
        .collection("meus_livros")
        .snapshots()
        .map(_bookListFromSnapshot);
  }

  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    List<Book> books = List();
    for (var doc in snapshot.docs) {
      books.add(Book.fromMap(doc.id, doc.data()));
    }
    return books;
  }
}
