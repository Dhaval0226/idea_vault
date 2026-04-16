import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  String gender = "Male";
  int selectedAvatar = 0;

  List<String> avatars = [
    "👨",
    "👩",
    "🤖",
    "🐶",
  ];

  void continueToHome() {
    if (nameController.text.isEmpty || emailController.text.isEmpty) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(
          name: nameController.text,
          age: ageController.text,
          email: emailController.text,
          gender: gender,
          avatar: avatars[selectedAvatar],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),

            Text(
              "Idea Vault",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            // Avatar selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(avatars.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedAvatar = index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedAvatar == index
                          ? Colors.orange
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      avatars[index],
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 30),

            // Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // Age
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // Gender
            DropdownButtonFormField<String>(
              value: gender,
              items: ["Male", "Female", "Other"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => gender = val!),
              decoration: InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              onPressed: continueToHome,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}