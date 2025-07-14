import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/baby_profile.dart';
import '../providers/baby_profile_provider.dart';

class BabySetupScreen extends StatefulWidget {
  @override
  _BabySetupScreenState createState() => _BabySetupScreenState();
}

class _BabySetupScreenState extends State<BabySetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _birthDate;

  void _submit() {
    if (_formKey.currentState!.validate() && _birthDate != null) {
      // Save baby profile to provider and navigate to next screen
      final babyProfile = BabyProfile(
        name: _nameController.text.trim(),
        birthDate: _birthDate!,
      );
      // Use Provider to save baby profile
      final provider = Provider.of<BabyProfileProvider>(context, listen: false);
      provider.setBabyProfile(babyProfile);

      // Navigate to PermissionsScreen
      Navigator.of(context).pushReplacementNamed('/permissions');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter all required information')),
      );
    }
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Baby Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Enter your baby\'s name and birthdate',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Baby Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter baby\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    _birthDate == null
                        ? 'Select Birthdate'
                        : 'Birthdate: ${_birthDate!.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _pickBirthDate,
                    child: Text('Pick Date'),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Save and Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
