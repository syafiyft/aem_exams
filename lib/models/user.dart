// User model represents a person from the API
class User {
  final int id; // User's unique ID
  final String name; // User's name
  final String email; // User's email address
  const User(
      {required this.id,
      required this.name,
      required this.email}); // Constructor for User

  factory User.fromJson(
          Map<String, dynamic>
              j) => // Factory constructor to create a User from JSON
      User(
          id: j['id'] as int,
          name: j['name'] as String,
          email: j['email'] as String);
}
