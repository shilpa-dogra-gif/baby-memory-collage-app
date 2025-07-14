import 'package:flutter/material.dart';
import '../models/baby_profile.dart';

class BabyProfileProvider with ChangeNotifier {
  BabyProfile? _babyProfile;

  BabyProfile? get babyProfile => _babyProfile;

  void setBabyProfile(BabyProfile profile) {
    _babyProfile = profile;
    notifyListeners();
  }
}
