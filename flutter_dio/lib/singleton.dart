/// 单例模式
/// 同时，在实现单例模式时，也需要考虑如下几点，以防在使用过程中出现问题：
//
// 是否需要懒加载，即类实例只在第一次需要时创建。
// 是否线程安全，在 Java、C++ 等多线程语言中需要考虑到多线程的并发问题。由于 Dart 是单线程模型的语言，所有的代码通常都运行在同一个 isolate 中，因此不需要考虑线程安全的问题。
// 在某些情况下，单例模式会被认为是一种 反模式，因为它违反了 SOLID 原则中的单一责任原则，单例类自己控制了自己的创建和生命周期，且单例模式一般没有接口，扩展困难。
// 单例模式的使用会影响到代码的可测试性。如果单例类依赖比较重的外部资源，比如 DB，我们在写单元测试的时候，希望能通过 mock 的方式将它替换掉。而单例类这种硬编码式的使用方式，导致无法实现 mock 替换。
// 在实际编码过程中，单例模式常见应用有：
//
// 全局日志的 Logger 类、应用全局的配置数据对象类，单业务管理类。
// 创建实例时占用资源较多，或实例化耗时较长的类。
/// 参考文章

/// step1:
// class Singleton {
//   static late Singleton _instance;
//    //
//   Singleton._internal();
//
//   static Singleton getInstance() {
//     if(_instance == null) {
//       _instance = Singleton._internal();
//     }
//
//     return _instance;
//   }
// }

// 调用:
// final singleton = Singleton.getInstance()

// step2:
// class Singleton {
//   static late Singleton _instance;
//
//   static get instance {
//     if(_instance == null) {
//       _instance = Singleton._internal();
//     }
//
//     return _instance;
//   }
//
//   Singleton._internal();
// }

// 调用:
// Singalton singalton = Singalton.instance;

// // step3:
// class Singalton {
//   static late Singalton _instance;
//
//   Singalton._internal();
//
//   factory Singalton() {
//     if(_instance == null) {
//       _instance = Singalton._internal();
//     }
//
//     return _instance;
//   }
// }

///这里，使用 ?? 作为 _instance 实例的判空操作符，如果为空则调用构造函数实例化否则直接返回，也可以达到单例的效果。
//
// 以上，Dart 单例中懒加载的无不是使用判空来实现的（if (_instance == null) 或 ??），但是在 Dart 空安全特性里还有一个非常重要的操作符 late ，它在语言层面就实现了实例的懒加载，如下面这个例子：

// 调用:
// Singalton singalton = Singalton();

// class Singalton {
//   static late Singalton _instance;
//
//   Singalton._internal() {
//     _instance = this;
//   }
//
//   factory Singalton() => _instance ?? Singalton._internal();
// }

/// 被标记为 late 的变量 _instance 的初始化操作将会延迟到字段首次被访问时执行，而不是在类加载时就初始化。
/// 这样，Dart 语言特有的单例模式的实现方式就这么产生了。
class Singalton {
  Singalton._internal();

  factory Singalton() => _instance;

  // TODO: 这里提示unnecessary late 是否可以去除late关键字
  static late final Singalton _instance = Singalton._internal();
}
