import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/database_bloc.dart';
import 'package:projeto_4/bloc/database_event.dart';
import 'package:projeto_4/models/book_models.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({this.book}) : super();

  @override
  Widget build(BuildContext context) {
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
            trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () {
                  BlocProvider.of<DatabaseBloc>(context)
                      .add(DeleteDatabase(docId: book.id));
                }),
          ),
        ));
  }
}
