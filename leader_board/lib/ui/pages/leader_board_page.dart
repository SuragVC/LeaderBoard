import 'package:flutter/material.dart';
import 'package:leader_board/controller/api_controller.dart';
import 'package:leader_board/schemas.dart';
import 'package:leader_board/ui/widgets/award_widget.dart';
import 'package:leader_board/ui/widgets/leader_board_list.dart';
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
    return Scaffold(
      appBar: null,
      backgroundColor: Color.fromARGB(255, 9, 13, 17),
      body: leaderBoardList.isEmpty
          ? const CircularProgressIndicator()
          : Column(
              children: [
                TopLeaderAwardWidget(
                  topLeaders: topLeaders!,
                ),
                SingleChildScrollView(
                    child: LeaderBoardList(leaderBoardList: leaderBoardList))
              ],
            ),
    );
  }
}
