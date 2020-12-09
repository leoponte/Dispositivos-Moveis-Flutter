import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/auth_bloc.dart';
import 'package:projeto_4/bloc/auth_state.dart';
import 'package:projeto_4/bloc/database_bloc.dart';
import 'package:projeto_4/views/Home/home.dart';

import 'auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, AuthState state) {
        if (state is Authenticated) {
          return BlocProvider<DatabaseBloc>(
              create: (context) {
                return DatabaseBloc(state.user.uid);
              },
              child: Home());
        } else {
          return Authenticate();
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
