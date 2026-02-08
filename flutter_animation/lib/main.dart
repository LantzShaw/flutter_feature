import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Animation Demo'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                width: 300.0,
                height: 200.0,
                color: Colors.green,
                // 文字变化 没有动画
                child: Text('Hello'),
                // child: Center(
                //   child: CircularProgressIndicator(),
                // ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // AnimatedCrossFade(firstChild: firstChild, secondChild: secondChild, crossFadeState: crossFadeState, duration: duration)
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: 300.0,
              height: 200.0,
              color: Colors.purple,
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                duration: Duration(seconds: 1),
                // 新旧控件如果不是同一种控件，则会有动画效果，
                // child 控件发生变化(即两个相同的控件， 不会触发动画，这是因为flutter底层作了优化)，或者ke发生变化，再或者由null ->  控件也会触发动画
                // child: Text('Hi', key: ValueKey('hi'),),
                // child: Text('Hi', key: ValueKey('hi'),),
                child: Text(
                  'Hello world',
                  key: UniqueKey(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            )
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
