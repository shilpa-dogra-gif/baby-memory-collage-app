import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool _cameraGranted = false;
  bool _photosGranted = false;

  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final photosStatus = await Permission.photos.request();

    setState(() {
      _cameraGranted = cameraStatus.isGranted;
      _photosGranted = photosStatus.isGranted;
    });

    if (_cameraGranted && _photosGranted) {
      // Permissions granted, navigate to home or next screen
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permissions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'We need access to your camera and photo library to create collages.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                _cameraGranted ? Icons.check_circle : Icons.error,
                color: _cameraGranted ? Colors.green : Colors.red,
              ),
              title: Text('Camera Access'),
              subtitle: Text(_cameraGranted
                  ? 'Granted'
                  : 'Required to take photos'),
            ),
            ListTile(
              leading: Icon(
                _photosGranted ? Icons.check_circle : Icons.error,
                color: _photosGranted ? Colors.green : Colors.red,
              ),
              title: Text('Photo Library Access'),
              subtitle: Text(_photosGranted
                  ? 'Granted'
                  : 'Required to select photos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _requestPermissions,
              child: Text('Request Permissions'),
            ),
          ],
        ),
      ),
    );
  }
}
