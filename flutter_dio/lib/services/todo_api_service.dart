import 'package:flutter_dio/models/task_model.dart';
import 'package:flutter_dio/models/todo_model.dart';
import 'package:flutter_dio/network/http_client.dart';
import 'package:flutter_dio/network/http_response.dart';

class TodoApiService {
  // static Future<List<Todo>> fetchTodoList() async {
  //   try {
  //     final HttpResponse response = await HttpClient().get('/user');
  //
  //     if(response.ok) {
  //       List<Todo> todoList = (response.data.data as List).map((todoItem) => Todo.fromJson(todoItem)).toList();
  //
  //       return todoList;
  //     } else {
  //       return [];
  //     }
  //   } on DioException catch (error) {
  //     print('============error===========${error}');
  //
  //     return [];
  //   }
  // }

  TodoApiService._internal();

  factory TodoApiService() => _instance;

  static final TodoApiService _instance = TodoApiService._internal();

  static Future<List<Todo>> fetchUserList(
      {int? limit = 10, int? page = 1}) async {
    final HttpResponse response =
        await HttpClient().get('/users', queryParameters: {
      'limit': limit,
      'page': page,
    });

    if (response.ok) {
      List<Todo> todoList = (response.data.data as List)
          .map((todoItem) => Todo.fromJson(todoItem))
          .toList();

      return todoList;
    } else {
      return [];
    }
  }

  /// Get Todo List
  static Future<List<Task>> fetchTodoList() async {
    final HttpResponse response = await HttpClient().get('/todos');

    if (response.ok) {
      List<Task> taskList = (response.data.data as List)
          .map((todoItem) => Task.fromJson(todoItem))
          .toList();

      return taskList;
    } else {
      return [];
    }
  }

  /// Get Todo Item By Id
  static Future<Task> fetchTodoItemById(int id) async {
    final HttpResponse response = await HttpClient().get('/todos/$id');

    return Task.fromJson(response.data.data);
  }

  /// Updating Todo Item By Id
  static Future<HttpResponse> updateTodoItemById(Task task) async {
    final HttpResponse response =
        await HttpClient().put('/todos', data: task.toJson());

    return response;
  }

  /// Delete Todo Item By Id
  static Future<HttpResponse> deleteTodoItemById(int id) async {
    final HttpResponse response = await HttpClient().delete('/todo?id=${id}');

    return response;
  }
}
