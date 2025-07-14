import 'package:flutter/material.dart';

class ThemesScreen extends StatefulWidget {
  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  // Sample theme data with local asset images
  final List<Map<String, dynamic>> _themes = [
    {
      'name': '8 Month Milestone',
      'type': 'milestone',
      'min_age': 8,
      'max_age': 8,
      'assetPath': 'assets/images/8month.png',
      'tags': ['Milestone', 'Popular'],
    },
    {
      'name': 'Christmas 2025',
      'type': 'holiday',
      'date': '2025-12-25',
      'assetPath': 'assets/images/christmas2025.png',
      'tags': ['Holiday', 'New'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: ListView.builder(
        itemCount: _themes.length,
        itemBuilder: (context, index) {
          final theme = _themes[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                theme['assetPath'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
              ),
              title: Text(theme['name']),
              subtitle: Text(theme['type']),
              trailing: Wrap(
                spacing: 6,
                children: (theme['tags'] as List<String>)
                    .map((tag) => Chip(label: Text(tag)))
                    .toList(),
              ),
              onTap: () {
                // TODO: Implement theme download or mark favorite
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Theme "${theme['name']}" selected')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
