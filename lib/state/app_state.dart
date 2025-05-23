import 'package:flutter/material.dart';
import '../models/xp_profile.dart';
import '../models/workout_session.dart';
import '../models/climb_attempt.dart';
import '../models/quest.dart';
import '../mock_data/mock_climb_attempts.dart';
import '../mock_data/mock_quests.dart';


class AppState extends ChangeNotifier {
  XPProfile xpProfile;
  WorkoutSession? currentSession;
  List<ClimbAttempt> loggedClimbs;
  List<Quest> quests;

  AppState()
      : xpProfile = XPProfile(
          totalXP: 0,
          level: 1,
          streakCount: 0,
          xpHistory: [],
          activeQuests: mockQuests,
        ),
        loggedClimbs = mockClimbs,
        currentSession = null,
        quests = mockQuests;

  void startNewSession() {
    currentSession = WorkoutSession(
      startTime: DateTime.now(),
      climbAttempts: [],
      duration: Duration.zero,
      completed: false,
      sessionXP: 0,
    );
    notifyListeners();
  }

  void logClimb(ClimbAttempt climb) {
    if (currentSession != null) {
      currentSession!.climbAttempts.add(climb);
      loggedClimbs.add(climb);
      currentSession!.sessionXP += _calculateXP(climb);
      _updateQuestProgress(climb);
      notifyListeners();
    }
  }

  void endSession() {
    if (currentSession != null) {
      currentSession!.completed = true;
      xpProfile.totalXP += currentSession!.sessionXP;
      xpProfile.xpHistory.add(currentSession!.sessionXP);
      currentSession = null;
      notifyListeners();
    }
  }

  int _calculateXP(ClimbAttempt climb) {
    return 20 + climb.attempts.clamp(1, 10); // example logic
  }

  void _updateQuestProgress(ClimbAttempt climb) {
    for (var quest in quests) {
      if (quest.completed) continue;

      bool matches = false;

      if (quest.type == "style" &&
          quest.styleTag != null &&
          climb.styleTags.contains(quest.styleTag)) {
        matches = true;
      } else if (quest.type == "grade" &&
          quest.grade != null &&
          climb.grade == quest.grade) {
        matches = true;
      } else if (quest.type == "count") {
        matches = true;
      }

      if (matches) {
        quest.progress++;
        if (quest.progress >= quest.target) {
          quest.completed = true;
        }
      }
    }

    notifyListeners();
  }
}