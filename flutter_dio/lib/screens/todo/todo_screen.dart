import 'package:flutter/material.dart';
import 'package:flutter_dio/models/task_model.dart';
import 'package:flutter_dio/providers/todo_provider.dart';
import 'package:flutter_dio/screens/new_todo/new_todo_screen.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  CheckboxListTile _buildItem(context, index) {
    return CheckboxListTile(
      value: false,
      onChanged: (bool? value) {},
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<TodoProvider>().fetchTasks();

    // TodoApiService.fetchTodoList().then((value) {
    //   print('==========${value.toString()}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool loading = context.watch<TodoProvider>().loading;

    // TODO:
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
          SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: context.watch<TodoProvider>().refreshController,
            onLoading: context.watch<TodoProvider>().onLoading,
            onRefresh: context.watch<TodoProvider>().onRefresh,
            child: !loading
                ? context.watch<TodoProvider>().totalTask > 0
                    ? ListView.separated(
                        padding: EdgeInsets.all(12.0),
                        itemBuilder: (BuildContext context, int index) {
                          Task task =
                              context.read<TodoProvider>().taskList[index];

                          return CheckboxListTile(
                            key: GlobalObjectKey(index),
                            value: task.completed,
                            onChanged: (bool? value) {
                              context.read<TodoProvider>().togoTodo(task.id);
                            },
                            title: Text(
                                '${task.title}${context.watch<TodoProvider>().totalTask}'),
                            subtitle: Text('${task.id}'),
                            tileColor: Colors.purple.withOpacity(0.2),
                            activeColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            controlAffinity: ListTileControlAffinity.platform,
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(
                          height: 16.0,
                        ),
                        itemCount: context.watch<TodoProvider>().totalTask,
                      )
                    : Center(
                        child: Text(
                          'No Todo List',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF999999),
                          ),
                        ),
                      )
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.2),
                    offset: Offset(3, 4),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ],
              ),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('已完成:'),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '${context.read<TodoProvider>().completedTasks.length}项',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Ok'),
                    style: ButtonStyle(
                      // 阴影
                      elevation: MaterialStateProperty.all(0.0),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purple.withOpacity(0.3),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(8.0),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
