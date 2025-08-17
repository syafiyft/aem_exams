import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class UsersScreen extends StatelessWidget {
  static const route = '/users';
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder<List<User>>(
        future: ApiService.fetchUsers(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child:
                    Text('Error: ${snap.error}', textAlign: TextAlign.center),
              ),
            );
          }
          final users = snap.data ?? const <User>[];
          if (users.isEmpty) return const Center(child: Text('No users found'));

          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final u = users[i];
              return ListTile(
                title: Text(u.name,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(u.email),
              );
            },
          );
        },
      ),
    );
  }
}
