import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const _base = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> fetchUsers() async {
    final uri = Uri.parse('$_base/users');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body) as List;
      return data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
    }
    throw Exception('Failed to load users (${res.statusCode})');
  }
}
