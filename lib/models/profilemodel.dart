class Profile {
  Profile(
    this.age,
    this.name,
    this.height,
    this.gender,
    this.maritalStatus,
    this.address,
    this.colors,
  );

  String name;
  int age;
  double height;
  Gender gender;
  bool maritalStatus;
  Map<String, String> address;
  List<String> colors;
}

enum Gender { male, female, others }
