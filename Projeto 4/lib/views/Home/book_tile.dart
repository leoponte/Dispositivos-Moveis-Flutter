import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/database_bloc.dart';
import 'package:projeto_4/bloc/database_event.dart';
import 'package:projeto_4/models/book_models.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({this.book}) : super();

  @override
  Widget build(BuildContext contextA) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[book.nota * 100],
            ),
            title: Text(book.titulo),
            subtitle: Text(book.autor),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () {
                    BlocProvider.of<DatabaseBloc>(contextA)
                        .add(DeleteDatabase(docId: book.id));
                  }),
              Text("             "),
              GestureDetector(
                  child: Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                        context: contextA,
                        builder: (contextinho) {
                          return AlertDialog(
                            title: Text("Editar "),
                            content: Column(
                              children: [
                                Text("Titulo:"),
                                TextField(
                                  controller: TextEditingController()
                                    ..text = book.titulo,
                                  onChanged: (text) => {book.titulo = text},
                                ),
                                Text("Autor:"),
                                TextField(
                                  controller: TextEditingController()
                                    ..text = book.autor,
                                  onChanged: (text) => {book.autor = text},
                                ),
                                Text("Nota:"),
                                TextField(
                                  controller: TextEditingController()
                                    ..text = book.nota.toString(),
                                  onChanged: (text) =>
                                      {book.nota = int.parse(text)},
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  BlocProvider.of<DatabaseBloc>(contextA).add(
                                      UpdateDatabase(
                                          bookId: book.id,
                                          titulo: book.titulo,
                                          autor: book.autor,
                                          nota: book.nota));
                                  Navigator.of(contextinho).pop();
                                },
                                child: Text("submit"),
                              )
                            ],
                          );
                        });

                    /*BlocProvider.of<DatabaseBloc>(context)
                        .add(DeleteDatabase(docId: book.id));
*/
                  }),
            ]),
          ),
        ));
  }
}
