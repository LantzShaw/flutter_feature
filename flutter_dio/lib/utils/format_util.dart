/// 常用方法: https://juejin.cn/post/7084860694155231262

// Set 去重
List<int> list = [1, 2, 3, 4];

Set<int> uniqueSet = list.toSet();

List<int> uniqueList = uniqueSet.toList();

// folder去重
List<String> fruits = ['apple', 'banan', 'banan', 'apple'];

List<String> uniqueResult = fruits.fold([], (previousValue, element) {
  if (!previousValue.contains(element)) {
    previousValue.add(element);
  }

  return previousValue;
});

// 深度去重

// 判断类型
// is
// runtimeType

void main() {
  int total = 0;

  print('--------data---------${total is int}');

  print('=========total========${total.runtimeType}');
}
