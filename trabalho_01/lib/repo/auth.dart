import 'package:trabalho_01/models/user_model.dart';

abstract class AuthRepo {
  //Future<UserModel> signInAnonimo();
  Future<UserModel> signInWithEmailAndPassword({String email, String password});
  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password});
  Future<void> signOut();
  Stream<UserModel> get user;
}
