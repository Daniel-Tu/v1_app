class ClimbAttempt {
  final String grade;
  final List<String> styleTags;
  final int attempts;
  final String result; // e.g. "topped" or "fell"
  final String? thoughts;
  final DateTime date;

    ClimbAttempt({
    required this.grade,
    required this.styleTags,
    required this.attempts,
    required this.result,
    this.thoughts,
    required this.date,
  });

}

