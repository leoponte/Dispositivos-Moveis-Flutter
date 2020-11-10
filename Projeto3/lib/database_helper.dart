import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tutorial/register.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper helper = DatabaseHelper._createInstance();
  static Database _database;

  String registerTable = "register_table";
  String columnid = "id";
  String columnname = "name";
  String columnusername = "username";
  String columnemail = "email";
  String columnpassword = "password";
  String columnrole = "role";
  String columnclassroom = "class";

  DatabaseHelper._createInstance();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  /* Criando o arquivo no sistema de arquivos */
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "register.db";

    var registerDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return registerDatabase;
  }

/*Criar o Banco de dados*/
  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $registerTable ($columnid INTEGER PRIMARY KEY AUTOINCREMENT, $columnname text, $columnusername text, $columnemail text, $columnpassword text, $columnrole INTEGER, $columnclassroom text)");
  }

/*Inserir no Banco de dados*/
  insertNote(LoginData logindata) async {
    Database db = await this.database;
    //var result = await db.rawInsert("INSERT ...");
    var result = await db.insert(registerTable, logindata.toMap());
    return result;
  }

/* Pegar Valores do Banco*/
  getNoteMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery("SELECT * FROM $registerTable");
    return print(result);
  }
/*
  getNoteList() async {
    var loginMapList = await getNoteMapList();
    int count = loginMapList.length;
    List<LoginData> loginList = List<LoginData>();

    for (int i = 0; i < count; i++) {
      loginList.add(LoginData.fromMap(loginMapList[i]));
    }
    return loginList;
  }
*/

/*
  updateNote(LoginData note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: "$colId = ?", whereArgs: [note.id]);
    // var result = await db.rawUpdate("...");
    return result;
  }
*/
/*
  deleteNote(int id) async {
    Database db = await this.database;
    var result =
        await db.rawDelete("DELETE FROM $noteTable WHERE $colId = $id");
    // var result = await db.delete(...);
    return result;
  }
*/
  getCount() async {
    Database db = await this.database;
    var x = await db.rawQuery("SELECT COUNT(*) FROM $registerTable");
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
