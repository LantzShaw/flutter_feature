import 'package:flutter/material.dart';
import 'package:flutter_dio/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class NewTodoScreen extends StatefulWidget {
  const NewTodoScreen({super.key});

  @override
  State<NewTodoScreen> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  @override
  void initState() {
    super.initState();

    context.read<TodoProvider>().getTodoItem(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new Todo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Text('add a todo'),
    );
  }
}
