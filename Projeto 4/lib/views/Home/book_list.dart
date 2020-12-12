import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/database_bloc.dart';
import 'package:projeto_4/bloc/database_state.dart';
import 'package:projeto_4/models/book_models.dart';

import 'book_tile.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is BookDatabaseState) {
          List<Book> list = state.books;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return BookTile(book: list[index]);
              });
        } else {
          return Text("Você é mágico");
        }
      },
    );
  }
}
