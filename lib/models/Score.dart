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
      health: double.parse(json['health'].toString()),
      natural: double.parse(json['natural'].toString()),
      environment: double.parse(json['environment'].toString()),
    );
  }
}
