import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/database_bloc.dart';
import 'package:projeto_4/bloc/database_event.dart';
import 'package:projeto_4/models/book_models.dart';

class BookEntry extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final Book inModel = Book();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: addBookFormulario(context),
    );
  }

  Widget addBookFormulario(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter titulo";
                  }
                  return null;
                },
                onSaved: (String value) {
                  inModel.titulo = value;
                },
                decoration:
                    InputDecoration(hintText: "Título", labelText: "Título")),
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter autor";
                  }
                  return null;
                },
                onSaved: (String value) {
                  inModel.autor = value;
                },
                decoration:
                    InputDecoration(hintText: "Autor", labelText: "Autor")),
            TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return "Please enter nota";
                  }
                  int nota = int.parse(value);
                  if (!(0 <= nota && nota <= 10)) {
                    return "Adicione uma nota entre 0 e 10";
                  }

                  return null;
                },
                onSaved: (String value) {
                  inModel.nota = int.parse(value);
                },
                decoration:
                    InputDecoration(hintText: "Nota", labelText: "Nota")),
            RaisedButton(
                child: Text("Register"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    BlocProvider.of<DatabaseBloc>(context).add(AddDatabase(
                        titulo: inModel.titulo,
                        autor: inModel.autor,
                        nota: inModel.nota));
                    formKey.currentState.reset();
                  }
                })
          ],
        ));
  }
}
