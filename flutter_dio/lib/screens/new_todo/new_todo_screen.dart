import 'package:flutter/material.dart';

class NewTodoScreen extends StatelessWidget {
  const NewTodoScreen({super.key});

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
