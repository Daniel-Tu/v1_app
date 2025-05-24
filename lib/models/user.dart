import 'quest.dart';
import 'friend_request.dart';

class User {
  String userId;
  String username;

  int totalXP;
  int level;
  int streakCount;

  String generalGrade;
  String maxGrade;
  String flashGrade;

  List<Quest> activeQuests;
  Map<String, int> weeklyXP;
  Map<String, int> monthlyXP;

  List<String> friendIds;
  List<FriendRequest> incomingRequests;

  User({
    required this.userId,
    required this.username,
    required this.totalXP,
    required this.level,
    required this.streakCount,
    required this.generalGrade,
    required this.maxGrade,
    required this.flashGrade,
    required this.activeQuests,
    required this.weeklyXP,
    required this.monthlyXP,
    required this.friendIds,
    required this.incomingRequests,
  });
}
