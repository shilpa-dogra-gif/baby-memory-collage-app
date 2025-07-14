import 'package:flutter/material.dart';

class CreateCollageScreen extends StatefulWidget {
  @override
  _CreateCollageScreenState createState() => _CreateCollageScreenState();
}

class _CreateCollageScreenState extends State<CreateCollageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Collage'),
      ),
      body: Center(
        child: Text(
          'Collage creation flow will be implemented here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
