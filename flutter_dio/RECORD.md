# RECORD

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
- 