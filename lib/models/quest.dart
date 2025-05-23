class Quest {
  String id;
  String description;
  String type; // "style", "grade", or "count"
  String? styleTag;
  String? grade;
  int target;
  int progress;
  bool completed;

  Quest({
    required this.id,
    required this.description,
    required this.type,
    this.styleTag,
    this.grade,
    required this.target,
    required this.progress,
    required this.completed,
  });
}
