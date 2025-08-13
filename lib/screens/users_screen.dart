// lib/screens/users_screen.dart
import 'package:flutter/material.dart'; // This brings in all the Flutter widgets.
import '../services/api_service.dart'; // This brings in our code to get users from the internet.
import '../models/user.dart'; // This brings in our User class.

class UsersScreen extends StatelessWidget {
  static const route =
      '/users'; // This is the name we use to go to this screen.
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')), // The top bar with the title.
      body: FutureBuilder<List<User>>(
        // This widget waits for something to finish (like loading users from the internet).
        future: ApiService.fetchUsers(), // Tell it to get the users.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // If we're still waiting, show a spinning circle.
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Error: ${snapshot.error}',
                    textAlign: TextAlign
                        .center), // If something went wrong, show an error message.
              ),
            );
          }
          final users = snapshot.data ??
              const <User>[]; // Get the list of users, or an empty list if there aren't any.
          if (users.isEmpty) {
            return const Center(
                child: Text('No users found')); // If the list is empty, say so.
          }
          return ListView.separated(
            itemCount: users.length, // Tell the list how many users we have.
            separatorBuilder: (_, __) =>
                const Divider(height: 1), // Put a line between each user.
            itemBuilder: (context, i) {
              final u = users[i]; // Get the user for this row.
              return ListTile(
                title: Text(u.name,
                    style: const TextStyle(
                        fontWeight:
                            FontWeight.w600)), // Show the user's name in bold.
                subtitle:
                    Text(u.email), // Show the user's email under their name.
              );
            },
          );
        },
      ),
    );
  }
}
