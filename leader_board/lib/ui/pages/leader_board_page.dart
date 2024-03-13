import 'package:flutter/material.dart';
import 'package:leader_board/controller/api_controller.dart';
import 'package:leader_board/schemas.dart';
import 'package:provider/provider.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({super.key});

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<User> leaderBoardList = [];
  TopLeaders? topLeaders;
  @override
  void initState() {
    super.initState();
    Provider.of<ApiController>(context, listen: false).fetchLeaderBoard();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    leaderBoardList =
        Provider.of<ApiController>(context, listen: true).leaderBoard;
    topLeaders = Provider.of<ApiController>(context, listen: true).topLeaders;
  }

  @override
  Widget build(BuildContext context) {
    return leaderBoardList.isEmpty
        ? const CircularProgressIndicator()
        : Container();
  }
}
