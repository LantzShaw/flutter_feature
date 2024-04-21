class Todo {
  final int id;
  final String name;
  final String username;
  final String email;

  Todo(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'];
}
