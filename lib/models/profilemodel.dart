// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_test1/controllers/authcontroller.dart';

final users = firestore.collection('Users');

FirebaseFirestore firestore = FirebaseFirestore.instance;

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.uid,
    required this.name,
    required this.email,
    required this.address,
    required this.height,
    required this.gender,
    required this.dob,
  });

  String uid;
  String name;
  String email;
  Address address;
  double height;
  int gender;
  DateTime dob;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        height: json["height"].toDouble(),
        gender: json["gender"],
        dob: json["dob"].toDate());
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "address": address.toJson(),
        "height": height,
        "gender": gender,
        "dob": dob,
        "uid": uid,
        "updatedDate": DateTime.now(),
        "updatedBy": authController.auth.currentUser?.uid,
      };

  add() {
    users.doc(uid).set(toJson());
  }
}

class Address {
  Address({
    required this.line1,
    this.line2,
  });

  String line1;
  String? line2;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
        line2: json["line2"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "line2": line2,
      };
}

enum Gender { male, female, others }
