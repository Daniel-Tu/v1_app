import 'climb_attempt.dart';

class WorkoutSession {
  DateTime startTime;
  List<ClimbAttempt> climbAttempts;
  Duration duration;
  bool completed;
  int sessionXP;

    WorkoutSession({
    required this.startTime,
    required this.climbAttempts,
    required this.duration,
    required this.completed,
    required this.sessionXP,
  });
}
