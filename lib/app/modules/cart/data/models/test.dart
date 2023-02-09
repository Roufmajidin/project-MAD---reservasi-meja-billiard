 
 import 'package:cloud_firestore/cloud_firestore.dart';
 class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data as Map;
    return User(
      name: data['name'],
      age: data['age'],
    );
  }
}