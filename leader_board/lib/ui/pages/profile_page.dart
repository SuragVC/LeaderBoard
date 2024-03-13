import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leader_board/controller/state_controller.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
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
        backgroundColor:
            Provider.of<StateController>(context).themeData.canvasColor,
        title: const Text('User Profile'),
      ),
      backgroundColor:
          Provider.of<StateController>(context).themeData.primaryColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              CircleAvatar(
                radius: 60,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipOval(
                    child: Image.network(
                      profilePic,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/profile_icon.png",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Text(
                userName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              Text(
                'User ID: ${userData["userId"]}',
                style: const TextStyle(fontSize: 18),
              ),
              const Gap(10),
              Text(
                'Points: ${userData["points"]}',
                style: const TextStyle(fontSize: 18),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
