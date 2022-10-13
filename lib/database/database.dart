import 'package:hive_flutter/hive_flutter.dart';

class TaskDataBase {
  List toDoList = [];
  final _mrybox = Hive.box("mrydev");

  void createInitialData() {
    toDoList = [
      ["Yeni bir görev ekle.", true],
      ["Yeni görev eklemek için + butonuna tıklayabilirsin.", false],
      ["Eklenmiş görevleri silmek için sola kaydır.", false]
    ];
  }

  void loadData() {
    toDoList = _mrybox.get("TODOLIST");
  }

  void updateDataBase() {
    _mrybox.put("TODOLIST", toDoList);
  }
}
