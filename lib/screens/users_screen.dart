import 'package:flutter/material.dart'; // Import Flutter's material design library
import '../services/api_service.dart'; // Import the API service for fetching users
import '../models/user.dart'; // Import the User model

class UsersScreen extends StatelessWidget {
  // UsersScreen is a stateless widget (doesn't hold state)
  static const route = '/users'; // Route name for navigation
  const UsersScreen({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Build method describes the UI
    return Scaffold(
      // Scaffold provides the basic visual layout structure
      appBar:
          AppBar(title: const Text('Users')), // App bar with the title 'Users'
      body: FutureBuilder<List<User>>(
        // FutureBuilder waits for the async fetchUsers() call
        // Fetch users asynchronously
        future: ApiService.fetchUsers(), // Call the API to get users
        builder: (context, snap) {
          // Builder function gets called when the future changes
          if (snap.connectionState == ConnectionState.waiting) {
            // If still loading...
            // Show loading indicator while waiting
            return const Center(
                child: CircularProgressIndicator()); // Show a spinner
          }
          if (snap.hasError) {
            // If there was an error...
            // Display error message if fetch fails
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.all(16), // Add padding around the error
                child: Text('Error: ${snap.error}',
                    textAlign: TextAlign.center), // Show the error message
              ),
            );
          }
          final users = snap.data ??
              const <User>[]; // Get the list of users, or an empty list if null
          if (users.isEmpty)
            return const Center(
                child: Text('No users found')); // If no users, show message

          // Display list of users
          return ListView.separated(
            // ListView with dividers between items
            itemCount: users.length, // Number of users
            separatorBuilder: (_, __) =>
                const Divider(height: 1), // Divider between users
            itemBuilder: (context, i) {
              // Build each user row
              final u = users[i]; // Get the user at index i
              return ListTile(
                title: Text(u.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600)), // User's name in bold
                subtitle: Text(u.email), // User's email below the name
              );
            },
          );
        },
      ),
    );
  }
}
