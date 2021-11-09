class AllCalories {
  double carbs;
  double fats;
  double proteins;
  double other;

  AllCalories({
    required this.carbs,
    required this.fats,
    required this.proteins,
    required this.other,
  });

  List<double> toDoubleList() {
    return [this.carbs, this.fats, this.proteins, this.other];
  }
}
