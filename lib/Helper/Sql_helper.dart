import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/Model/Person.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper x = DbHelper._();
  Database database;
  static final String dbasename = 'QuizDB.db';
  static final String PersonTapleName = 'Person';
  static final String PersonIdColumnName = 'id';
  static final String PersonEmailColumnName = 'email';
  static final String PersonPasswordColumnName = 'password';
  static final String PersonNameColumnName = 'name';

  intiateDatabase() async {
    database = await getDatBaseConnection();
  }

  Future<Database> getDatBaseConnection() async {
    //library :path provider
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dbasename';
    Database database =
        await openDatabase(path, version: 1, onOpen: (database) {
      print('the data base is opened');
    }, onCreate: (db, v) async{
     await db.execute(
          '''CREATE TABLE $PersonTapleName ($PersonIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, 
          $PersonEmailColumnName TEXT,$PersonNameColumnName TEXT, $PersonPasswordColumnName TEXT)''');
    });
    return database;
  }

  Future<int> insertPerson(Person person) async {
    int rownum = await database.insert(PersonTapleName, person.toMap());
    print(rownum);
    return rownum;
  }

  Future<List<Person>> getAllPersons() async {
    List<Map<String, Object>> results = await database.query(PersonTapleName);
    List<Person> persons = results.map((e) => Person.fromMap(e)).toList();
    return persons;
  }

  Future<Person> getSpecificPerson(int id) async {
    List<Map<String, dynamic>> results =
        await database.query(PersonTapleName, where: 'id=?', whereArgs: [id]);
    Person person = Person.fromMap(results.first);
    return person;
  }

  deletePerson(int id) async {
    database.delete(PersonTapleName, where: 'id=?', whereArgs: [id]);
  }

  updatePerson(Person person) async {
    database.update(PersonTapleName, person.toMap(),
        where: 'id=?', whereArgs: [person.id]);
  }

  Future<List<String>> getTablesNames() async {
    List<Map<String, Object>> tables = await database
        .query('sqlite_master', where: 'type=?', whereArgs: ['table']);
    List<String> tablesNames = tables.map((e) => e['name'].toString()).toList();
    print(tablesNames);
    return tablesNames;
  }
}
