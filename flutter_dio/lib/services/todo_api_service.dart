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

  static Future<List<Todo>> fetchTodoList() async {
    final HttpResponse response = await HttpClient().get('/users');

    if (response.ok) {
      List<Todo> todoList = (response.data.data as List)
          .map((todoItem) => Todo.fromJson(todoItem))
          .toList();

      return todoList;
    } else {
      return [];
    }
  }
}
