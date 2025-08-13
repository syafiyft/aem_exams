// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/simple_list_screen.dart';
import 'screens/login_form_screen.dart';
import 'screens/users_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Section 2 — Coding Tasks',
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xFF01A99D)),
      home: const HomeScreen(),
      routes: {
        SimpleListScreen.route: (_) => const SimpleListScreen(),
        LoginFormScreen.route: (_) => const LoginFormScreen(),
        UsersScreen.route: (_) => const UsersScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Section 2 — Coding Tasks')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _NavCard(
              title: 'Task 6: Simple List (SnackBar)',
              route: SimpleListScreen.route),
          _NavCard(
              title: 'Task 7: Login Form (Validation)',
              route: LoginFormScreen.route),
          _NavCard(
              title: 'Task 8: Users API (Loading + Error)',
              route: UsersScreen.route),
        ],
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final String title;
  final String route;
  const _NavCard({required this.title, required this.route});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
