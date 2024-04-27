import 'package:flutter/material.dart';
import 'package:flutter_dio/models/task_model.dart';
import 'package:flutter_dio/providers/todo_provider.dart';
import 'package:flutter_dio/screens/new_todo/new_todo_screen.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  CheckboxListTile _buildItem(context, index) {
    return CheckboxListTile(
      value: false,
      onChanged: (bool? value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final int totalTask = context.watch<TodoProvider>().taskList.length;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.0,
        leading: TextButton(
          child: Text('Delete'),
          onPressed: () {},
        ),
        title: Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewTodoScreen()),
                );
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Stack(
        children: [
          totalTask != 0
              ? ListView.separated(
                  padding: EdgeInsets.all(12.0),
                  itemBuilder: (context, index) {
                    final Task task =
                        context.watch<TodoProvider>().taskList[index];

                    return CheckboxListTile(
                      value: task.completed,
                      onChanged: (bool? value) {
                        context.read<TodoProvider>().togoTodo(task.id);
                      },
                      title: Text('${task.title}'),
                      subtitle: Text('${task.id}'),
                      tileColor: Colors.purple.withOpacity(0.2),
                      activeColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      controlAffinity: ListTileControlAffinity.platform,
                    );
                  },
                  separatorBuilder: (_, __) => Divider(
                    height: 0.5,
                  ),
                  itemCount: totalTask,
                )
              : const Center(
                  child: Text(
                    'No Todo List',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('button')],
              ),
            ),
          )
        ],
      ),
    );
  }
}
