import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:trabalho_01/bloc/auth_state.dart';
import 'package:trabalho_01/firebase/auth.dart';
import 'package:trabalho_01/models/user_model.dart';
import 'package:trabalho_01/repo/auth.dart';

import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo _authenticationService;
  StreamSubscription _authenticationStream;

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService = FirebaseAuthenticationService();

    _authenticationStream =
        _authenticationService.user.listen((UserModel event) {
      add(InnerServerEvent(event));
    });
  }

  @override
  Stream<AuthState> mapEventToState(event) async* {
    try {
      if (event == null) {
        yield Unauthenticated();
      } else if (event is RegisterUser) {
        print("TENTEI NO BLOC");
        await _authenticationService.createUserWithEmailAndPassword(
            email: event.username,
            password: event.password,
            nome: event.name,
            role: event.role);
      } else if (event is LoginUser) {
        await _authenticationService.signInWithEmailAndPassword(
            email: event.username, password: event.password);
      } else if (event is Logout) {
        await _authenticationService.signOut();
      } else if (event is InnerServerEvent) {
        if (event.userModel == null) {
          yield Unauthenticated();
        } else {
          yield Authenticated(event.userModel);
        }
      }
    } on FirebaseException catch (err) {
      print('Failed with error code: ${err.code}');
      String teste = "Sem conexão com a internet";
      yield AuthError(teste);
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  @override
  Future<void> close() {
    _authenticationStream.cancel();
    return super.close();
  }
}
