import 'package:crud_persistence_alura/components/task.dart';
import 'package:crud_persistence_alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static String taskTable = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    final Database database = await getDatabase();

    var itemExists = await find(task.nome);
    var taskMap = toMap(task);
    if (itemExists.isEmpty) {
      return await database.insert(
        _tablename,
        taskMap,
      );
    } else {
      return await database.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> map = {};
    map[_name] = task.nome;
    map[_difficulty] = task.dificuldade;
    map[_image] = task.foto;
    return map;
  }

  Future<List<Task>> findAll() async {
    final Database database = await getDatabase();

    final List<Map<String, dynamic>> result = await database.query(_tablename);

    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    return toList(result);
  }

  delete(String taskName) async {
    final Database database = await getDatabase();

    return await database
        .delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }

  List<Task> toList(List<Map<String, dynamic>> taskList) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> task in taskList) {
      final Task tk = Task(task[_name], task[_image], task[_difficulty]);
      tasks.add(tk);
    }

    return tasks;
  }
}
