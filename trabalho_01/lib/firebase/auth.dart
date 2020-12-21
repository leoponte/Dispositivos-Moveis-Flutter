import 'package:firebase_auth/firebase_auth.dart';
import 'package:trabalho_01/models/user_model.dart';
import 'package:trabalho_01/repo/auth.dart';

class FirebaseAuthenticationService implements AuthRepo {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(user.uid) : null;
  }

  /*Future<UserModel> signInAnonimo() async {
    UserCredential authResult = await _firebaseAuth.signInAnonymously();
    User user = authResult.user;
    print("USER ID: ${user.uid}");
    return _userFromFirebaseUser(user);
  }*/

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = authResult.user;
    print("USER ID: ${user.uid}");
    return _userFromFirebaseUser(user);
  }

  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password}) async {
    UserCredential authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = authResult.user;
    print("USER ID: ${user.uid}");
    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
