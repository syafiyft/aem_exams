// lib/screens/simple_list_screen.dart
import 'package:flutter/material.dart'; // This brings in all the Flutter widgets, like building blocks for our app.

class SimpleListScreen extends StatelessWidget {
  static const route = '/list'; // This is the name we use to go to this screen.
  const SimpleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
        10,
        (i) =>
            'Item ${i + 1}'); // Make a list of 10 items, like 'Item 1', 'Item 2', ...
    return Scaffold(
      appBar: AppBar(
          title: const Text('Simple List')), // The top bar with the title.
      body: ListView.builder(
        itemCount: items.length, // Tell the list how many items we have.
        itemBuilder: (context, index) {
          final title = items[index]; // Get the name for this row.
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8), // Add space around each row.
            title: Text(title,
                style: const TextStyle(
                    fontWeight:
                        FontWeight.w600)), // Show the item name in bold.
            subtitle: Text(
                'Subtitle for $title'), // Show a smaller subtitle under the name.
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      title))); // When you tap, show a message at the bottom with the item name.
            },
          );
        },
      ),
    );
  }
}
