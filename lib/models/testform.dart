
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<Map<String, dynamic>> profileRef = FirebaseFirestore.instance.collection('Profiles');

class Profile {
  Profile({
    required this.name,
    required this.age,
  });
  String name;
  String age;
  
 Map<String, dynamic> toJson() => {"name" : name, "age" : age};

  add() {
   return profileRef.add(toJson()).then((value) => null);
 }
 update(){

 }

}



class ProfileForm {
  String? name;
  String? age;

  ProfileForm({this.name, this.age});

  factory ProfileForm.fromProfile(Profile profile) =>
      ProfileForm(name: profile.name, age: profile.age);

  Profile get profile => Profile(name: name!, age: age!);
}
