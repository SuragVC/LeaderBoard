import 'package:flutter/material.dart';
import 'package:leader_board/schemas.dart';
import 'package:leader_board/ui/widgets/list_card.dart';

class LeaderBoardList extends StatefulWidget {
  const LeaderBoardList({Key? key, required this.leaderBoardList})
      : super(key: key);

  final List<User> leaderBoardList;

  @override
  State<LeaderBoardList> createState() => _LeaderBoardListState();
}

class _LeaderBoardListState extends State<LeaderBoardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: widget.leaderBoardList.length,
        itemBuilder: (context, index) {
          final user = widget.leaderBoardList[index];
          final rank = index + 4;
          return LeaderListItem(
            user: user,
            rank: rank,
          );
        },
      ),
    );
  }
}
