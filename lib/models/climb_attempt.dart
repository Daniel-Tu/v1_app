class ClimbAttempt {
  String grade;
  List<String> styleTags;
  int attempts;
  String result; // e.g. "topped" or "fell"
  String? thoughts;
  DateTime date;

    ClimbAttempt({
    required this.grade,
    required this.styleTags,
    required this.attempts,
    required this.result,
    this.thoughts,
    required this.date,
  });

}

