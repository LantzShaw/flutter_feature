class Todo {
  int userId;
  int id;
  String title;

  Todo({required this.userId, required this.id, required this.title});

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['useId'],
        id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title};
  }
}
