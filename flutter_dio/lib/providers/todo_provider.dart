import 'package:flutter/cupertino.dart';
import 'package:flutter_dio/models/task_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<Task> _taskList = [];

  void addTodo(Task task) {
    _taskList.add(task);
  }

  List<Task> get taskList => _taskList;
  List<Task> get incompletedTasks =>
      _taskList.where((element) => !element.completed).toList();
  List<Task> get completedTasks =>
      _taskList.where((element) => element.completed).toList();

  /// NOTE: 这种方式也可以
  // void removeTodo(Task task) {
  //     _taskList.remove(task);
  // }

  void removeTodo(int id) {
    // _taskList.firstWhere((element) => element.id == id);

    _taskList.removeWhere((element) => element.id == id);

    notifyListeners();
  }

  /// NOTE: 这种方式也可以
  // void toggleTodo(Task task) {
  //   final int index = _taskList.indexOf(task);
  //
  //   _taskList[index].completed = !_taskList[index].completed;
  // }

  void togoTodo(int id) {
    final int index = _taskList.indexWhere((element) => element.id == id);
    _taskList[index].completed = !_taskList[index].completed;

    notifyListeners();
  }
}
