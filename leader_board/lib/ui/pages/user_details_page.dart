import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leader_board/controller/state_controller.dart';
import 'package:leader_board/schemas.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      backgroundColor:
          Provider.of<StateController>(context).themeData.canvasColor,
      body: SingleChildScrollView(
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
                    user.profilePic,
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
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            Text(
              'User ID: ${user.userId}',
              style: TextStyle(fontSize: 18),
            ),
            const Gap(10),
            Text(
              'Points: ${user.points}',
              style: TextStyle(fontSize: 18),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
