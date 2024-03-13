import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final userData = {
    "userId": "7",
    "name": "Sarah Garcia",
    "profilePic": "https://randomuser.me/api/portraits/women/3.jpg",
    "points": 2300
  };
  @override
  Widget build(BuildContext context) {
    String profilePic = userData["profilePic"] as String;
    String userName = userData["name"] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profilePic),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'User ID: ${userData["userId"]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Points: ${userData["points"]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
