import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/baby_profile_provider.dart';
import 'create_collage_screen.dart';
import 'themes_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _buildProfileView() {
    final babyProfile = Provider.of<BabyProfileProvider>(context).babyProfile;
    if (babyProfile == null) {
      return Center(child: Text('No baby profile found.'));
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Baby Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text('Name: ${babyProfile.name}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Birthdate: ${babyProfile.birthDate.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  static const List<Widget> _widgetOptionsPlaceholder = <Widget>[
    Center(child: Text('My Collages')),
    // Placeholder for Create New replaced with empty container
    SizedBox.shrink(),
    // Placeholder for Themes replaced with empty container
    SizedBox.shrink(),
    Center(child: Text('Settings')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;
    if (_selectedIndex == 0) {
      bodyContent = _buildProfileView();
    } else if (_selectedIndex == 1) {
      // Show CreateCollageScreen for "Create New" tab
      bodyContent = CreateCollageScreen();
    } else if (_selectedIndex == 2) {
      // Show ThemesScreen for "Themes" tab
      bodyContent = ThemesScreen();
    } else {
      bodyContent = _widgetOptionsPlaceholder.elementAt(_selectedIndex);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Memory Collage'),
      ),
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'My Collages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Create New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: 'Themes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}
