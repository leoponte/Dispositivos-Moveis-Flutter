import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trabalho_01/bloc/database_bloc.dart';
import 'package:trabalho_01/login.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';

import 'maindrawer.dart';

//MyTheme currentTheme = MyTheme(); // Usado para mudança de ligth mode para night mode

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAppi());
}

// FAZ PARTE DO WRAPPER
class MyAppi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, AuthState state) {
        print("RECEBI MENSAGEM NO WRAPPER");
        if (state is Authenticated) {
          return BlocProvider<DatabaseBloc>(
              create: (context) {
                return DatabaseBloc(state.user.uid);
              },

              //print("Autenticado");
              child: MyMainDrawer());
        } else {
          return MyApp();
        }
      },
      listener: (context, AuthState state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Erro no Servidor"),
                  content: Text(state.message),
                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      },
    );
  }
}

// TERMINA O WRAPPER
