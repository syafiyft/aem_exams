import 'package:flutter/material.dart'; // Import Flutter's material design library

class SimpleListScreen extends StatelessWidget {
  // This screen shows a simple list
  static const route = '/list'; // Route name for navigation
  const SimpleListScreen({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Build method describes the UI
    final items = List.generate(
        10,
        (i) =>
            'Item ${i + 1}'); // Make a list of 10 items, like 'Item 1', 'Item 2', ...
    return Scaffold(
      // Scaffold provides the basic visual layout structure
      appBar: AppBar(
          title: const Text('Simple List')), // The top bar with the title.
      body: ListView.builder(
        // ListView.builder efficiently builds list items
        itemCount: items.length, // Tell the list how many items we have.
        itemBuilder: (context, index) {
          // Builds each row in the list
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
