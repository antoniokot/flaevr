class Score {
  final double health;
  final double natural;
  final double environment;

  Score({
    required this.health,
    required this.natural,
    required this.environment,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      health: json['health'],
      natural: json['natural'],
      environment: json['environment'],
    );
  }
}