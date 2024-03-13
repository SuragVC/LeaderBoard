import 'package:dio/dio.dart';
import 'package:leader_board/schemas.dart';

class ApiImplementation {
  static Dio dio = Dio();

  static Future<LeaderBoardResult> fetchLeaderBoard() async {
    String url = "https://run.mocky.io/v3/078310bd-5004-4d1e-af40-65917daa6eeb";
    try {
      Response<dynamic> response = await dio.get(url);

      return LeaderBoardResult.fromJson(response.data);
    } catch (e) {
      print("Error fetching leaderboard: $e");
      throw e; // Rethrow the error to handle it elsewhere
    }
  }
}
