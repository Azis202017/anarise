import 'package:get/get.dart';

import '../../../data/model/leaderboard_model.dart';
import '../../../data/model/quiz_score_model.dart';
import '../../../shared/services/leaderboard_service.dart';

class QuizScoreController extends GetxController {
  QuizScore score = Get.arguments['score'];
  String type = Get.arguments['type'];  
  String id = Get.arguments['materialId'];
  List<Leaderboard> leaderboard = [];
  bool isLoading = true;
  
  @override
  void onInit() {
    fetchLeaderboardData();
    super.onInit();
  }
  Future<void> fetchLeaderboardData() async {
    print(id);
    leaderboard = await LeaderboardService().fetchLeaderboardData(type: type,id: id);
    isLoading  = false;
    update(); 
  }
  int? searchStudentIdInLeaderboard(List<Leaderboard> leaderboardList) {
    for (var leaderboard in leaderboardList) {
      if (leaderboard.studentId != null) {
        return leaderboard.rank;
      }
    }
    return null;
  }
}
