import 'package:flutter_dio/models/user_address.dart';

class User {
  int id;
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String avatar;
  final UserAddress address;

  User({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        phone: json['phone'],
        avatar: json['avatar'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
        'avatar': avatar,
        'address': address
      };
}
