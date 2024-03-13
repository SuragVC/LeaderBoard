import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leader_board/schemas.dart';

class TopLeaderAwardWidget extends StatelessWidget {
  final TopLeaders topLeaders;

  const TopLeaderAwardWidget({super.key, required this.topLeaders});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = constraints.maxHeight * 0.8;

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/leaderboard.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: _buildLeaderAvatarWithInfo(topLeaders.first, imageSize),
            ),
            Positioned(
              top: 140,
              left: constraints.maxWidth * 0.07,
              child: _buildLeaderAvatarWithInfo(topLeaders.second, imageSize),
            ),
            Positioned(
              top: 160,
              right: constraints.maxWidth * 0.10,
              child: _buildLeaderAvatarWithInfo(topLeaders.third, imageSize),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLeaderAvatarWithInfo(User user, double imageSize) {
    return Column(
      children: [
        CircleAvatar(
          radius: 33,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipOval(
              child: Image.network(
                user.profilePic,
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/profile_icon.png",
                    fit: BoxFit.cover,
                    width: imageSize,
                    height: imageSize,
                  );
                },
              ),
            ),
          ),
        ),
        const Gap(20),
        Text(
          user.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          user.points.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
