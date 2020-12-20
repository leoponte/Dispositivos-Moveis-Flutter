import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_01/bloc/auth_event.dart';
import 'package:trabalho_01/login.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';
import 'register.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, AuthState state) {
      print("RECEBI MENSAGEM NO WRAPPER");
      if (state is Authenticated) {
        print("Autenticado");
        return MyMainDrawer();
      } else {
        return MyApp();
      }
    });
  }
}
// TERMINA O WRAPPER
