import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:leader_board/schemas.dart';

class ApiImplementation {
  static Dio dio = Dio();

  static Future<LeaderBoardResult> fetchLeaderBoard() async {
    String url =
        "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard";
    try {
      Response<dynamic> response = await dio.get(url);
      var jsonDecoded = jsonDecode(response.data);
      return LeaderBoardResult.fromJson(jsonDecoded);
    } catch (e) {
      print("Error fetching leaderboard: $e");
      throw e; // Rethrow the error to handle it elsewhere
    }
  }
}
