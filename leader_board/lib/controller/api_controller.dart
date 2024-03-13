import 'package:flutter/material.dart';
import 'package:leader_board/implementation/api_implementation.dart';
import 'package:leader_board/schemas.dart';

class ApiController extends ChangeNotifier {
  List<User> _leaderBoardList = [];
  List<User> get leaderBoard => _leaderBoardList;
  set leaderBoard(List<User> value) {
    _leaderBoardList = value;
    notifyListeners();
  }

  TopLeaders? _topLeaders;
  TopLeaders? get topLeaders => _topLeaders;

  setTopLeaders(List<User> leaders) {
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
    LeaderBoardResult result = await ApiImplementation.fetchLeaderBoard();
    setTopLeaders(result.leaders);
  }
}
