import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leader_board/constants/constant_colors.dart';
import 'package:leader_board/controller/state_controller.dart';
import 'package:leader_board/schemas.dart';
import 'package:provider/provider.dart';

class TopLeaderAwardWidget extends StatefulWidget {
  final TopLeaders topLeaders;

  const TopLeaderAwardWidget({super.key, required this.topLeaders});

  @override
  State<TopLeaderAwardWidget> createState() => _TopLeaderAwardWidgetState();
}

class _TopLeaderAwardWidgetState extends State<TopLeaderAwardWidget> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = constraints.maxHeight * 0.8;
        return Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    height: 320,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/leaderboard.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              child: _buildLeaderAvatarWithInfo(
                  widget.topLeaders.first, imageSize),
            ),
            Positioned(
              top: 140,
              left: constraints.maxWidth * 0.07,
              child: _buildLeaderAvatarWithInfo(
                  widget.topLeaders.second, imageSize),
            ),
            Positioned(
              top: 160,
              right: constraints.maxWidth * 0.10,
              child: _buildLeaderAvatarWithInfo(
                  widget.topLeaders.third, imageSize),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Provider.of<StateController>(context).isLightMode
                    ? const Icon(
                        Icons.nightlight_round,
                        color: ConstantColors.darkButtonColor,
                      )
                    : const Icon(
                        Icons.sunny,
                        color: ConstantColors.lightButtonColor,
                      ), // Moon icon
                onPressed: () {
                  Provider.of<StateController>(context, listen: false)
                      .toggleTheme();
                },
              ),
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
