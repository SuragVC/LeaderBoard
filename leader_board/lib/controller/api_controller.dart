import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:leader_board/controller/network_controller.dart';
import 'package:leader_board/implementation/api_implementation.dart';
import 'package:leader_board/schemas.dart';

class ApiController extends ChangeNotifier {
  NetworkController networkController = NetworkController();
  List<User> _leaderBoardList = [];
  List<User> get leaderBoard => _leaderBoardList;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set leaderBoard(List<User> value) {
    _leaderBoardList = value;
    notifyListeners();
    isLoading = false;
  }

  TopLeaders? _topLeaders;
  TopLeaders? get topLeaders => _topLeaders;

  setTopLeaders(List<User> leaders) {
    if (leaders.isEmpty) {
      isLoading = false;
      return;
    }
    leaders.sort((a, b) => b.points.compareTo(a.points));

    _topLeaders =
        TopLeaders(first: leaders.first, second: leaders[1], third: leaders[3]);
    leaders.removeAt(0);
    leaders.removeAt(1);
    leaders.removeAt(2);
    leaderBoard = leaders;
    notifyListeners();
  }

  fetchLeaderBoard() async {
    ConnectivityResult connectivityResult =
        await networkController.connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      LeaderBoardResult result =
          await ApiImplementation.fetchLeaderBoardFromSharedPref();
      setTopLeaders(result.leaders);
    } else {
      LeaderBoardResult result = await ApiImplementation.fetchLeaderBoard();
      setTopLeaders(result.leaders);
    }
  }
}
