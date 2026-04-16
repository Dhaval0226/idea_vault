import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String age;
  final String email;
  final String gender;
  final String avatar;

  ProfileScreen({
    required this.name,
    required this.age,
    required this.email,
    required this.gender,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(avatar, style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 20),

            Text(name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            Text("Age: $age"),
            Text("Email: $email"),
            Text("Gender: $gender"),
          ],
        ),
      ),
    );
  }
}