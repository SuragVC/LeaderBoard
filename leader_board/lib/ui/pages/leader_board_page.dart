import 'package:flutter/material.dart';
import 'package:leader_board/controller/api_controller.dart';
import 'package:leader_board/schemas.dart';
import 'package:leader_board/ui/widgets/award_widget.dart';
import 'package:leader_board/ui/widgets/leader_board_list.dart';
import 'package:lottie/lottie.dart';
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
      backgroundColor: const Color.fromARGB(255, 9, 13, 17),
      body: Provider.of<ApiController>(context, listen: true).isLoading
          ? Center(
              child: LottieBuilder.asset("assets/lottie/loader.json"),
            )
          : Provider.of<ApiController>(context, listen: true)
                  .leaderBoard
                  .isEmpty
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Please Turn on internet to load data',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    TopLeaderAwardWidget(
                      topLeaders: topLeaders!,
                    ),
                    SingleChildScrollView(
                      child: LeaderBoardList(leaderBoardList: leaderBoardList),
                    )
                  ],
                ),
    );
  }
}
