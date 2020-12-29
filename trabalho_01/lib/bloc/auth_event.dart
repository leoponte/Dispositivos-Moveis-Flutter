import 'package:trabalho_01/bloc/database_event.dart';
import 'package:trabalho_01/models/user_model.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String name;
  String username;
  String password;
  int role;
}

class LoginUser extends AuthEvent {
  String username;
  String password;
}

//class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class InnerServerEvent extends AuthEvent {
  final UserModel userModel;

  InnerServerEvent(this.userModel);
}
