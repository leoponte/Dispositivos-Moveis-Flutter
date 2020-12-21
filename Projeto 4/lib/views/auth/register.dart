import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/auth_bloc.dart';
import 'package:projeto_4/bloc/auth_event.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  RegisterUser registerData = RegisterUser();
  GlobalKey<FormState> formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text("Efetue o registro"),
        ),*/
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [registerFormulario()],
    )));
  }

  Widget registerFormulario() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter username";
                  }
                  return null;
                },
                onSaved: (String value) {
                  registerData.username = value;
                },
                decoration: InputDecoration(
                    hintText: "none@none.com",
                    labelText: "Username (email address)")),
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter password";
                  }
                  return null;
                },
                onSaved: (String value) {
                  registerData.password = value;
                },
                decoration: InputDecoration(
                    hintText: "Password", labelText: "Password")),
            RaisedButton(
                child: Text("Register"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    BlocProvider.of<AuthBloc>(context).add(registerData);
                  }
                })
          ],
        ));
  }
}
