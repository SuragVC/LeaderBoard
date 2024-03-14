import 'package:flutter/material.dart';
import 'package:leader_board/controller/network_controller.dart';
import 'package:leader_board/implementation/implementation.dart';
import 'package:leader_board/schemas.dart';
import 'package:leader_board/themes/dark_theme.dart';
import 'package:leader_board/themes/light_theme.dart';

class StateController extends ChangeNotifier {
  NetworkController networkController = NetworkController();
  List<User> _leaderBoardList = [];
  List<User> get leaderBoard => _leaderBoardList;
  bool _isLoading = true;
  bool _isLightMode = true;
  bool get isLoading => _isLoading;
  bool get isLightMode => _isLightMode;

  set isLightMode(bool value) {
    _isLightMode = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }

  toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
      isLightMode = false;
    } else {
      themeData = lightTheme;
      isLightMode = true;
    }
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
        TopLeaders(first: leaders.first, second: leaders[1], third: leaders[2]);
    leaders.removeAt(0);
    leaders.removeAt(0);
    leaders.removeAt(0);
    leaderBoard = leaders;
    notifyListeners();
  }

  fetchLeaderBoard({required BuildContext context}) async {
    NetworkController networkController = NetworkController();
    NetworkStatus currentStatus =
        await networkController.getCurrentNetworkStatus(context: context);
    if (currentStatus == NetworkStatus.Offline) {
      LeaderBoardResult result =
          await Implementation.fetchLeaderBoardFromSharedPref();
      setTopLeaders(result.leaders);
    } else {
      LeaderBoardResult result = await Implementation.fetchLeaderBoard();
      setTopLeaders(result.leaders);
    }
  }
}
