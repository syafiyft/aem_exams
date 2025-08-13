// lib/models/user.dart
class User {
  final int id; // This is the user's number (like a student ID).
  final String name; // This is the user's name.
  final String email; // This is the user's email address.
  const User(
      {required this.id,
      required this.name,
      required this.email}); // This makes a new user with all the info.

  factory User.fromJson(Map<String, dynamic> j) => User(
      id: j['id'] as int,
      name: j['name'] as String,
      email: j['email']
          as String); // This helps turn info from the internet into a User object.
}
