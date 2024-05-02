class Task {
  int id;
  String title;
  bool completed;

  Task({required this.id, required this.title, required this.completed});

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed};
}
