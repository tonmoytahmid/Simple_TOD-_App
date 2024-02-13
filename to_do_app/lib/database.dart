import 'package:hive/hive.dart';

class Database {
  List ToDoList = [];
  final _mybox = Hive.box("mybox");
  void creatforfirst() {
    ToDoList = [
      ["Do Exercise", false],
      ["Work hard", false],
    ];
  }

  void load() {
    ToDoList = _mybox.get("TODOLIST");
  }

  void update() {
    _mybox.put("TODOLIST", ToDoList);
  }
}
