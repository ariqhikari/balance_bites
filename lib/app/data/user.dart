part of 'data.dart';

class User {
  static String? id;
  final String name;
  final String email;
  static String? token;

  const User({
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        name: data['name'],
        email: data['email'],
      );

  User copyWith({
    String? name,
    String? email,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
