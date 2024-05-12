# RECORD

## Base

### Isolate 隔离

### Event Looop

```dart
类似Android的Handler/Looper机制，Dart也有相应的消息循环机制。

一个Dart应用中有一个消息循环和两个队列，一个是event队列，一个是microtask队列。
优先级问题：microtask队列的优先级是最高的，当所有microtask队列执行完之后才会从event队列中读取事件进行执行。
microtask队列中的event，
event队列包含所有的外来事件：I/O，mouse events，drawing events，timers，isolate之间的message等。
一般Future创建的事件是属于event队列的（利用Future.microtask方法例外），所以创建一个Future后，会插入到event队列中，顺序执行。

链接：https://juejin.cn/post/6844903893403451405
```

### Future
```dart
/// 参考文档
Future<R> then<R>(FutureOr<R> onValue(T value), {Function onError});
Future<T> catchError(Function onError, {bool test(Object error)});
Future<T> whenComplete(FutureOr action());

Future.value('123'); -> resolve
Future.error(Exception('something went wrong')); -> reject

// Future.then

Future.sync()

Future.delayed()

Future.catchError -> catch

Future.whenComplete() -> finally

var future = Future(() {
  print("hello")
})

Future.delayed(Duration(seconds: 2), () {
  print("hello")
})


// 根据某个集合，创建一系列的Future，并且会按顺序执行这些Futur
Future.foreach()


var future1 = new Future.delayed(new Duration(seconds: 1), () => 1);
var future2 =
new Future.delayed(new Duration(seconds: 2), () => 2);
var future3 = new Future.delayed(new Duration(seconds: 3), () => 3);
Future.wait({future1,future2,future3}).then(print).catchError(print);
//运行结果： [1, 2, 3]

// 等待多个future完成
Future.wait({})

Future.any（futures）

Future
    .any([1, 2, 5].map(
(delay) => new Future.delayed(new Duration(seconds: delay), () => delay)))
    .then(print)
    .catchError(print);

Future.doWhile()

Future.microtask(FutureOr computation())
```

## Widgets

### Checkbox

```dart
CheckBox({
  Key key,
  @required bool value,                  // 复选框的值
  bool tristate,                     // 为true时复选框会多一个值为null的状态，复选框内显示为横线
  @required ValueChanged<bool> onChanged,    // 点击复选框的回调
  Color activeColor,                      // 选中时复选框的颜色
  Color checkColor,                      // 选中时对号的颜色
  MaterialTapTargetSize materialTapTargetSize    // 有效点击区域的大小
})
```

### ListTile

```dart

```

### FutureBuilder


### AnimationBuilder


### ListTileCheckbox

```dart
CheckboxListTile(
    value: true,
    onChanged: (bool? value) {},
    title: Text('first'),
    tileColor: Colors.purple.withOpacity(0.2),
    activeColor: Colors.purple,
    subtitle: Text('This\'s the first block.'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    // 复选框、文字、图标的水平排列顺序
    controlAffinity: ListTileControlAffinity.platform,
  ),
```

```dart
/// 即ScrollNotification事件以及如何监听和拦截滚动通知
/// 用于截取滚动事件
NotificationListener(
  onNotification: () {
    
    return true; // 表示不往上冒泡

    return false; // 表示还要往上冒泡
},
  child: Text('123')
)

```

## Questions

- Flutter Stack布局，使用Positioned子组件无法铺满宽度的问题 `https://blog.jam00.com/article/info/63.html`

**解决方法:**
```dart
Stack(
  children: [
    Align( /// 换成这个
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
]
)
```
- Flutter: 使用 Isolate 解决 Future 卡顿 `https://juejin.cn/post/7007679972282204196?from=search-suggest`
```dart
/// https://juejin.cn/post/7049990302739726366


class _TestISOWidgetState extends State<TestISOWidget> {
  int _count = 0;

  //耗时工作，计算偶数个数
  static Future<int> asyncCountEven(int num) async {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  //模拟Future耗时
  void doMockTimeConsume() async {
    _count = await asyncCountEven(1000000000);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          ),
          Text(_count.toString()),
          TextButton(
            onPressed: () {
              //触发耗时操作
              doMockTimeConsume();
            },
            child: Text('开始耗时工作'),
          )
        ],
      ),
    );
  }
}

/// 解决方法：创建新线程，使用 Isolate
/// Flutter team 提供了两种方式让我们将计算移到新的线程中，compute 和 Isolate:

/// compute 轻量级，但它没有办法多次返回结果，也没有办法持续性的传值计算，每次调用，相当于新建一个隔离，如果调用过多的话反而会适得其反。
/// Isolate 消耗较重，除了创建耗时，每次创建还至少需要2Mb的空间。有OOM的风险。

/// 考虑到Isolate的消耗问题，dart team 已经为我们写好一个非常实用的 package，其中就包括 Isolate LoadBalancer 策略。

/// 链接：https://juejin.cn/post/7007679972282204196

//// 修改后
abstract class ISOManager {
  //提供外部首次初始化前修改
  static int isoBalanceSize = 2;

  //LoadBalancer 2个单位的线程池
  static Future<LoadBalancer> _loadBalancer =
  LoadBalancer.create(isoBalanceSize, IsolateRunner.spawn);

  //通过iso在新的线程中执行future内容体
  //R 为Future返回泛型，P 为方法入参泛型
  //function 必须为 static 方法
  static Future<R> loadBalanceFuture<R, P>(
      FutureOr<R> Function(P argument) function,
      P params,
      ) async {
    final lb = await _loadBalancer;
    return lb.run<R, P>(function, params);
  }
}
/// ISOManger 内部维护了一个线程池，并自动实现了负载均衡。

void doMockTimeConsume() async {
  // _count = await asyncCountEven(1000000000);
  _count = await ISOManager.loadBalanceFuture<int, int>(
      asyncCountEven, 1000000000);
  setState(() {});
}
```