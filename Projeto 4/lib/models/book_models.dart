class Book {
  String id;
  String titulo;
  String autor;
  int nota;

  Book({this.id, this.titulo, this.autor, this.nota});

  Book.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.titulo = map["titulo"];
    this.autor = map["autor"];
    this.nota = map["nota"];
  }
}
