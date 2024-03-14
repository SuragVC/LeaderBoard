import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leader_board/controller/network_controller.dart';
import 'package:leader_board/controller/state_controller.dart';
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
  NetworkController _networkController = NetworkController();
  late StreamSubscription<NetworkStatus> _networkStatusSubscription;
  @override
  void initState() {
    super.initState();
    Provider.of<StateController>(context, listen: false)
        .fetchLeaderBoard(context: context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    leaderBoardList =
        Provider.of<StateController>(context, listen: true).leaderBoard;
    topLeaders = Provider.of<StateController>(context, listen: true).topLeaders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Provider.of<StateController>(context)
          .themeData
          .scaffoldBackgroundColor,
      body: Provider.of<StateController>(context, listen: true).isLoading
          ? Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: LottieBuilder.asset("assets/lottie/loader.json")),
            )
          : Provider.of<StateController>(context, listen: true)
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
