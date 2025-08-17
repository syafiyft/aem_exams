class User {
  final String name;
  final String email;
  const User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> j) =>
      User(name: j['name'] as String, email: j['email'] as String);
}
