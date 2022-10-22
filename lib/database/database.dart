import 'package:hive_flutter/hive_flutter.dart';

class TaskDataBase {
  List toDoList = [];
  final _mrybox = Hive.box("mrydev");

  void createInitialData() {
    toDoList = [
      ["Yeni bir görev ekle.", true],
      ["Görev eklemek için alttaki butona basabilirsin.", false,],
      ["Silmek için sola kaydır.", false]
    ];
  }

  void loadData() {
    toDoList = _mrybox.get("TODOLIST");
  }

  void updateDataBase() {
    _mrybox.put("TODOLIST", toDoList);
  }
}
