import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:trabalho_01/models/user_model.dart';
import 'package:trabalho_01/repo/auth.dart';

class FirebaseAuthenticationService implements AuthRepo {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String papel;

  Stream<UserModel> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(user.uid) : null;
  }

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = authResult.user;
    print("USER ID: ${user.uid}");
    return _userFromFirebaseUser(user);
  }

  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password, String nome, int role}) async {
    UserCredential authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = authResult.user;

    if (role == 1)
      papel = "Professor";
    else if (role == 2) papel = "Aluno";

    final CollectionReference matematica =
        FirebaseFirestore.instance.collection("Matematica");
    final CollectionReference portugues =
        FirebaseFirestore.instance.collection("Portugues");
    final CollectionReference filosofia =
        FirebaseFirestore.instance.collection("Filosofia");
    final CollectionReference sociologia =
        FirebaseFirestore.instance.collection("Sociologia");
    final CollectionReference info =
        FirebaseFirestore.instance.collection("Informações adicionais");

    await matematica.doc(user.uid).set({
      "matBasica1": false,
      "matBasica2": false,
      "matBasica3": false,
      "matBasica4": false,
      "matBasica5": false,
      "matBasica6": false,
      "matBasica7": false,
      "matBasica8": false,
    });

    await portugues.doc(user.uid).set({
      "morfologia1": false,
      "morfologia2": false,
      "morfologia3": false,
      "morfologia4": false,
      "morfologia5": false,
      "morfologia6": false,
      "morfologia7": false,
      "morfologia8": false,
      "morfologia9": false,
      "morfologia10": false,
      "morfologia11": false,
      "morfologia12": false,
      "formacao1": false,
      "formacao2": false,
      "formacao3": false,
      "sintaxe1": false,
      "sintaxe2": false,
      "sintaxe3": false,
      "sintaxe4": false,
      "concordancia1": false,
      "concordancia2": false,
      "regencia1": false,
      "oracoes1": false,
      "oracoes2": false,
      "oracoes3": false,
      "oracoes4": false,
      "oracoes5": false,
      "oracoes6": false,
      "ortografia1": false,
      "regrasP1": false,
      "regrasA1": false,
      "regrasA2": false,
      "semantica1": false,
      "variacoes1": false,
    });

    await filosofia.doc(user.uid).set({
      "introducao1": false,
      "antigOri1": false,
      "antigOri2": false,
      "antigOri3": false,
      "antigOri4": false,
      "antigOci1": false,
      "antigOci2": false,
      "antigOci3": false,
      "antigOci4": false,
      "antigOci5": false,
      "antigOci6": false,
      "transiIdm1": false,
      "transiIdm2": false,
      "transiIdm3": false,
      "filoMod1": false,
      "filoMod2": false,
      "filoMod3": false,
    });

    await sociologia.doc(user.uid).set({
      "introSoc": false,
      "natureza1": false,
      "natureza2": false,
      "natureza3": false,
      "fundamentos1": false,
      "fundamentos2": false,
      "fundamentos3": false,
      "fundamentos4": false,
      "classicos1": false,
      "classicos2": false,
      "classicos3": false,
      "classicos4": false,
    });

    await info.doc(user.uid).set({
      "Nome": nome,
      "Papel": papel,
    });

    print("USER ID: ${user.uid}");
    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
