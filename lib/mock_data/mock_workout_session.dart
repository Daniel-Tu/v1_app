import '../models/workout_session.dart';
import '../models/climb_attempt.dart';
import 'mock_climb_attempts.dart';

final WorkoutSession mockWorkoutSession = WorkoutSession(
  startTime: DateTime.now().subtract(Duration(hours: 2, minutes: 30)),
  climbAttempts: mockClimbs.sublist(0, 5),
  duration: Duration(hours: 2, minutes: 25),
  completed: true,
  sessionXP: 120,
);
