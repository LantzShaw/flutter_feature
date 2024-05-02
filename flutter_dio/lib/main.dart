import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/models/todo_model.dart';
import 'package:flutter_dio/network/http_client.dart';
import 'package:flutter_dio/network/http_response.dart';
import 'package:flutter_dio/providers/todo_provider.dart';
import 'package:flutter_dio/screens/todo/todo_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

// import 'net_cache.dart';

void main() {
  // 确保flutter widget 绑定初始化
  // 参考文章: https://juejin.cn/post/7342766597243191331
  WidgetsFlutterBinding.ensureInitialized();

  // HttpConfig dioConfig = HttpConfig(
  //   baseUrl: 'https://jsonplaceholder.typicode.com',
  //   // proxy: '',
  //   // interceptors: [NetCacheInterceptor()],
  // );
  //
  // HttpClient client = HttpClient(dioConfig: dioConfig);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 单个
  // ChangeNotifierProvider(create: (_) => TodoProvider(), child: Scaffold())

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
      child: MaterialApp(
        title: 'Flutter Dio Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
          shadowColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        // home: const MyHomePage(title: 'Flutter Dio Demo Home Page'),
        home: TodoScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() async {
    // List<Todo> todoList = await TodoApiService.fetchTodoList();

    // print('=========toto list========${todoList[0].username}');

    // return;

    // final response =
    //     await dio.get('https://jsonplaceholder.typicode.com/users');

    // Map todoMap = json.decode(response);
    //
    // var todo = Todo.fromJson(todoMap);

    try {
      final HttpResponse response = await HttpClient().get('/users');

      // NOTE: 需要data.data
      // 参考文章: https://github.com/cfug/dio/issues/222
      // List<Map> list = (response.data.data as List).cast();
      // print('=========response=========${list[0]}');

      // List<Todo> todoList = (response.data.data as List)
      //     .cast()
      //     .map((e) => Todo.fromJson(e))
      //     .toList();
      //
      // print('=========todo list======${todoList[2].username}');

      List<Todo> todoList =
          (response.data.data as List).map((e) => Todo.fromJson(e)).toList();

      // String todoItem = todoList.join(',');

      // String strs = '2,3,4';
      // List todoItems = strs.split(',').toList();

      // List<int> data1 = todoList.reduce((value, element) => value + );
      int total = todoList.fold(
          0, (previousValue, element) => previousValue + element.id);

      List<int> arr = [1, 2, 4];

      final int result = arr.reduce((value, element) => value + element);

      // 数组去重
      Set<Todo> uniqeSet = todoList.toSet();
      List<Todo> uniqueTodoList = uniqeSet.toList();

      //

      print(
          '==========data=========${todoList.where((element) => element.id == 3).first.email}');

      Set set = Set();

      set.add(23);
      set.addAll([
        2,
        3,
        4,
      ]);

      // new Set([...todoList]);

      Map<String, dynamic> todoMap = Map();

      // todoMap.addAll({'light': '3'});

      // List todoList = response.data.data;
      // print('==========todo list==========' + todoList.toString());

      // Todo todoList = response.data
      // print('==========data========' + data);

      // List<dynamic> responseJson = jsonDecode(response.data.data);

      // print(
      //     '=========response data is ========${response.data.data.runtimeType}' +
      //         '${responseJson}');
    } on DioException catch (error) {
      print('============errror==========${error}');
    }

    // List<Map<String, dynamic>> responseJson = jsonDecode(response.data);
    //
    // print('========responseJson==========${responseJson}');

    // List<Todo> todoList =
    //     (response.data as List<dynamic>).map((e) => Todo.fromJson(e)).toList();

    // print('=======todoList======${todoList[0].id}');

    // var responseJson = jsonDecode(response.data.toString());
    //
    // List<Todo> todoList =
    //     (responseJson as List<dynamic>).map((e) => Todo.fromJson(e)).toList();

    // print('=========responseJson=========== + $todoList');

    // List<Todo> todoList = respon

    // print('===========response.data=========' + response.data.toString());

    // List<Map<String, dynamic>> todoListMap =
    //     json.decode(json.encode(response.data.toString()));

    // print('============todo list map ${todoListMap is List}=========');

    // print('============data==========' +
    //     json.decode(json.encode(response.data.toString())));

    // Todo todoList = Todo.fromJson(todoListMap);

    // var data = response.data;

    // List<Map<String, dynamic>> todoMap =
    //     json.decode(response.data).cast<Map<String, dynamic>>();zhuang

    // print('=======todo======' + '${todoMap}');

    // Todo todos = Todo.fromJson(jsonDecode(response.data));

    // var data = (jsonDecode(response.data) as List).cast<Map<String, dynamic>>();
    // const user = User.fromJson(json.decode(response) as string).toString();

    // print('=========reponse==========${response}' + '-------${todos}--------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
