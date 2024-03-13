import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:leader_board/schemas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Implementation {
  static Dio dio = Dio();

  static Future<LeaderBoardResult> fetchLeaderBoard() async {
    String url = "https://run.mocky.io/v3/078310bd-5004-4d1e-af40-65917daa6eeb";
    try {
      Response<dynamic> response = await dio.get(url);
      storeLeadersListInSharedPref(jsonEncode(response.data));
      return LeaderBoardResult.fromJson(response.data);
    } catch (e) {
      print("Error fetching leaderboard: $e");
      throw e;
    }
  }

  static Future<bool> storeLeadersListInSharedPref(String userList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString("leaderList", userList);
      return true;
    } catch (e) {
      print("Error fetching leaderboard: $e");
      throw e;
    }
  }

  static Future<LeaderBoardResult> fetchLeaderBoardFromSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? leaderList = prefs.getString("leaderList");
      if (leaderList == null) {
        return LeaderBoardResult(region: "", leaders: []);
      }
      return LeaderBoardResult.fromJson(jsonDecode(leaderList));
    } catch (e) {
      print("Error fetching leaderboard: $e");
      throw e;
    }
  }
}
