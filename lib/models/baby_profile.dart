class BabyProfile {
  final String name;
  final DateTime birthDate;

  BabyProfile({required this.name, required this.birthDate});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthDate': birthDate.toIso8601String(),
    };
  }

  factory BabyProfile.fromMap(Map<String, dynamic> map) {
    return BabyProfile(
      name: map['name'],
      birthDate: DateTime.parse(map['birthDate']),
    );
  }
}
