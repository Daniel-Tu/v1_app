import 'quest.dart';

class XPProfile {
  int totalXP;
  int level;
  int streakCount;
  List<int> xpHistory;
  List<Quest> activeQuests;

  XPProfile({
    required this.totalXP,
    required this.level,
    required this.streakCount,
    required this.xpHistory,
    required this.activeQuests,
  });
}
