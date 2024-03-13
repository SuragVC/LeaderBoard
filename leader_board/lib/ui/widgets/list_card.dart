import 'package:flutter/material.dart';
import 'package:leader_board/schemas.dart';

class LeaderListItem extends StatelessWidget {
  final User user;
  final int rank;

  const LeaderListItem({super.key, required this.user, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: _buildPointsCircle(rank),
        title: Text(user.name),
        trailing: _buildAvatar(user.profilePic),
        subtitle: Text(user.points.toString()),
      ),
    );
  }

  Widget _buildAvatar(String profilePic) {
    return CircleAvatar(
      radius: 28,
      backgroundImage: NetworkImage(profilePic),
    );
  }

  Widget _buildPointsCircle(int points) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          points.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
