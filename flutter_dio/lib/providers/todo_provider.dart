import 'package:flutter/cupertino.dart';
import 'package:flutter_dio/models/task_model.dart';
import 'package:flutter_dio/services/todo_api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TodoProvider extends ChangeNotifier {
  List<Task> _taskList = [];
  bool _loading = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void fetchTasks() async {
    EasyLoading.show(status: 'loading...');
    _loading = true;

    final List<Task> response = await TodoApiService.fetchTodoList();

    // _taskList.addAll(response);

    _taskList = response;

    EasyLoading.dismiss();

    _loading = false;

    notifyListeners();
  }

  void addTodo(Task task) {
    _taskList.add(task);
  }

  RefreshController get refreshController => _refreshController;
  bool get loading => _loading;
  List<Task> get taskList => _taskList;
  int get totalTask => _taskList.length;
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

    TodoApiService.updateTodoItemById(_taskList[index]);

    notifyListeners();
  }

  Future<Task> getTodoItem(int id) async {
    final Task task = await TodoApiService.fetchTodoItemById(id);

    return task;
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 3000));

    _refreshController.refreshCompleted();
  }

  void onRefresh() async {
    final List<Task> response = await TodoApiService.fetchTodoList();

    _taskList = response;

    _refreshController.refreshCompleted();
  }
}
