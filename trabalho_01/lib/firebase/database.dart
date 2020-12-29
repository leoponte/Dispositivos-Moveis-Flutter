import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trabalho_01/models/studies_models.dart';

class DatabaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid;

  DatabaseService({this.uid});

  someMethod() {
    final User user = auth.currentUser;
    final uid = user.uid;
    return uid;
  }

  final CollectionReference mathCollections =
      FirebaseFirestore.instance.collection("Roteiro de Estudos");

  addBookMatematica(
      bool matBasica1,
      bool matBasica2,
      bool matBasica3,
      bool matBasica4,
      bool matBasica5,
      bool matBasica6,
      bool matBasica7,
      bool matBasica8) async {
    return await mathCollections
        .doc(someMethod())
        .collection("Matematica")
        .add({
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

  addBookPortugues(
    bool morfologia1,
    bool morfologia2,
    bool morfologia3,
    bool morfologia4,
    bool morfologia5,
    bool morfologia6,
    bool morfologia7,
    bool morfologia8,
    bool morfologia9,
    bool morfologia10,
    bool morfologia11,
    bool morfologia12,
    bool formacao1,
    bool formacao2,
    bool formacao3,
    bool sintaxe1,
    bool sintaxe2,
    bool sintaxe3,
    bool sintaxe4,
    bool concordancia1,
    bool concordancia2,
    bool regencia1,
    bool oracoes1,
    bool oracoes2,
    bool oracoes3,
    bool oracoes4,
    bool oracoes5,
    bool oracoes6,
    bool ortografia1,
    bool regrasP1,
    bool regrasA1,
    bool regrasA2,
    bool semantica1,
    bool variacoes1,
  ) async {
    return await mathCollections.doc(someMethod()).collection("Portugues").add({
      "morfologia1": morfologia1,
      "morfologia2": morfologia2,
      "morfologia3": morfologia3,
      "morfologia4": morfologia4,
      "morfologia5": morfologia5,
      "morfologia6": morfologia6,
      "morfologia7": morfologia7,
      "morfologia8": morfologia8,
      "morfologia9": morfologia9,
      "morfologia10": morfologia10,
      "morfologia11": morfologia11,
      "morfologia12": morfologia12,
      "formacao1": formacao1,
      "formacao2": formacao2,
      "formacao3": formacao3,
      "sintaxe1": sintaxe1,
      "sintaxe2": sintaxe2,
      "sintaxe3": sintaxe3,
      "sintaxe4": sintaxe4,
      "concordancia1": concordancia1,
      "concordancia2": concordancia2,
      "regencia1": regencia1,
      "oracoes1": oracoes1,
      "oracoes2": oracoes2,
      "oracoes3": oracoes3,
      "oracoes4": oracoes4,
      "oracoes5": oracoes5,
      "oracoes6": oracoes6,
      "ortografia1": ortografia1,
      "regrasP1": regrasP1,
      "regrasA1": regrasA1,
      "regrasA2": regrasA2,
      "semantica1": semantica1,
      "variacoes1": variacoes1,
    });
  }

  addBookFilosofia(
    bool introducao1,
    bool antigOri1,
    bool antigOri2,
    bool antigOri3,
    bool antigOri4,
    bool antigOci1,
    bool antigOci2,
    bool antigOci3,
    bool antigOci4,
    bool antigOci5,
    bool antigOci6,
    bool transiIdm1,
    bool transiIdm2,
    bool transiIdm3,
    bool filoMod1,
    bool filoMod2,
    bool filoMod3,
  ) async {
    return await mathCollections.doc(someMethod()).collection("Filosofia").add({
      "introducao1": introducao1,
      "antigOri1": antigOri1,
      "antigOri2": antigOri2,
      "antigOri3": antigOri3,
      "antigOri4": antigOri4,
      "antigOci1": antigOci1,
      "antigOci2": antigOci2,
      "antigOci3": antigOci3,
      "antigOci4": antigOci4,
      "antigOci5": antigOci5,
      "antigOci6": antigOci6,
      "transiIdm1": transiIdm1,
      "transiIdm2": transiIdm2,
      "transiIdm3": transiIdm3,
      "filoMod1": filoMod1,
      "filoMod2": filoMod2,
      "filoMod3": filoMod3,
    });
  }

  addBookSociologia(
    bool introSoc,
    bool natureza1,
    bool natureza2,
    bool natureza3,
    bool fundamentos1,
    bool fundamentos2,
    bool fundamentos3,
    bool fundamentos4,
    bool classicos1,
    bool classicos2,
    bool classicos3,
    bool classicos4,
  ) async {
    return await mathCollections
        .doc(someMethod())
        .collection("Sociologia")
        .add({
      "introSoc": introSoc,
      "natureza1": natureza1,
      "natureza2": natureza2,
      "natureza3": natureza3,
      "fundamentos1": fundamentos1,
      "fundamentos2": fundamentos2,
      "fundamentos3": fundamentos3,
      "fundamentos4": fundamentos4,
      "classicos1": classicos1,
      "classicos2": classicos2,
      "classicos3": classicos3,
      "classicos4": classicos4,
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

Future<bool> someData1() async {
  bool result2;
  var query = await FirebaseFirestore.instance.collection("Matematica").get();
  for (int i = 0; i < query.docs.length; i++) {
    result2 = query.docs[i].data()["matBasica1"];
  }

  print(result2);
  return result2;
}

dataData() async {
  return await someData1();
}

getCurrentUserId() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  final uid = user.uid;
  return uid;
}
