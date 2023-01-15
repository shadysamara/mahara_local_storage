import 'dart:developer';
import 'dart:io';

import 'package:mahara_db/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  static const String tableName = "tasks";
  static const String taskIdColumn = "id";
  static const String taskNameColumn = "name";
  static const String taskIsCompleteColumn = "isComplete";
  late Database database;
  initilizaDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/tasks.db';
    database = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE $tableName ($taskIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, $taskNameColumn TEXT, $taskIsCompleteColumn INTEGER)');
    });
  }

  addNewTask(Task task) async {
    int rowIndex = await database.insert(tableName, task.toMap());
    log('row $rowIndex has been inserted');
  }

  Future<List<Task>> getAllTasks() async {
    List<Map<String, Object?>> results = await database.query(tableName);
    List<Task> tasks = results.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<bool> deleteTask(int taskId) async {
    int deletedRowsCount =
        await database.delete(tableName, where: 'id=?', whereArgs: [taskId]);
    return deletedRowsCount > 0 ? true : false;
  }

 Future<bool>  updateTask(Task task) async {
  int updatedRowsCount =   await database
        .update(tableName, task.toMap(), where: 'id=?', whereArgs: [task.id]);
   return updatedRowsCount > 0 ? true : false;
  }

  getAllTables() async {
    final tables =
        await database.rawQuery('SELECT * FROM tasks ORDER BY name;');
    log(tables.toString());
  }
}
