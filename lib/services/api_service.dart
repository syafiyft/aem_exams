// lib/services/api_service.dart
import 'dart:convert'; // This helps us change internet data into something Dart can use.
import 'package:http/http.dart' as http; // This lets us talk to the internet.
import '../models/user.dart'; // This brings in our User class.

class ApiService {
  static const _base =
      'https://jsonplaceholder.typicode.com'; // This is the website where we get our fake users.

  static Future<List<User>> fetchUsers() async {
    // This is a function that will get us a list of users, but it takes some time (so it's async).
    final uri = Uri.parse(
        '$_base/users'); // This is the full web address for the users.
    final resp = await http.get(uri); // Go to the internet and get the users.
    if (resp.statusCode == 200) {
      // If everything went well (code 200 means OK)...
      final List data = jsonDecode(resp.body)
          as List; // Change the internet data into a Dart list.
      return data
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(); // Turn each item into a User object.
    }
    throw Exception(
        'Failed to load users (${resp.statusCode})'); // If something went wrong, show an error.
  }
}
