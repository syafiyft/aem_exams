import 'package:flutter/material.dart';

class SimpleListScreen extends StatelessWidget {
  static const route = '/list';
  const SimpleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => 'Item ${i + 1}');
    return Scaffold(
      appBar: AppBar(title: const Text('Simple List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final title = items[index];
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text('Subtitle for $title'),
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(title)));
            },
          );
        },
      ),
    );
  }
}
