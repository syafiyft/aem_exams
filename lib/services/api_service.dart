import 'dart:convert'; // This helps us change internet data into something Dart can use.
import 'package:http/http.dart' as http; // This lets us talk to the internet.
import '../models/user.dart'; // This brings in our User class.

class ApiService {
  // Service class for API calls
  static const _base =
      'https://jsonplaceholder.typicode.com'; // Base URL for the API

  // Fetches a list of users from the API
  static Future<List<User>> fetchUsers() async {
    // Fetches a list of users from the API
    final uri = Uri.parse('$_base/users'); // Full URL for the users endpoint
    final res = await http.get(uri); // Make the HTTP GET request
    if (res.statusCode == 200) {
      // If the request was successful...
      final List data = jsonDecode(res.body)
          as List; // Decode the JSON response into a Dart list
      // Map each JSON object to a User instance
      return data
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(); // Convert each item to a User object
    }
    throw Exception(
        'Failed to load users (${res.statusCode})'); // If not successful, throw an error
  }
}
