// lib/main.dart
import 'package:flutter/material.dart'; // This brings in all the Flutter widgets, like building blocks for our app.
import 'screens/simple_list_screen.dart'; // This brings in the screen for Task 6 (the list with SnackBar).
import 'screens/login_form_screen.dart'; // This brings in the screen for Task 7 (the login form).
import 'screens/users_screen.dart'; // This brings in the screen for Task 8 (the users API).

void main() => runApp(
    const MyApp()); // This is where the app starts. It runs MyApp, which is our main widget.

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Section 2 — Coding Tasks', // The name of our app.
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed:
              const Color(0xFF01A99D)), // Set the app's colors and style.
      home: const HomeScreen(), // The first screen you see is HomeScreen.
      routes: {
        SimpleListScreen.route: (_) =>
            const SimpleListScreen(), // If you go to '/list', show the SimpleListScreen.
        LoginFormScreen.route: (_) =>
            const LoginFormScreen(), // If you go to '/form', show the LoginFormScreen.
        UsersScreen.route: (_) =>
            const UsersScreen(), // If you go to '/users', show the UsersScreen.
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Section 2 — Coding Tasks')), // The top bar with the title.
      body: ListView(
        padding: const EdgeInsets.all(16), // Add space around the list.
        children: const [
          _NavCard(
              title: 'Task 6: Simple List (SnackBar)',
              route: SimpleListScreen
                  .route), // A card for Task 6. Tap it to go to the list screen.
          _NavCard(
              title: 'Task 7: Login Form (Validation)',
              route: LoginFormScreen
                  .route), // A card for Task 7. Tap it to go to the login form.
          _NavCard(
              title: 'Task 8: Users API (Loading + Error)',
              route: UsersScreen
                  .route), // A card for Task 8. Tap it to go to the users API screen.
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
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w600)), // Show the task name in bold.
        trailing:
            const Icon(Icons.chevron_right), // Show an arrow to the right.
        onTap: () => Navigator.pushNamed(
            context, route), // When you tap, go to the right screen.
      ),
    );
  }
}
