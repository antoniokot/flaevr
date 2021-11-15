class AllCalories {
  double carbs;
  double fats;
  double proteins;

  AllCalories({
    required this.carbs,
    required this.fats,
    required this.proteins,
  });

  List<double> toDoubleList() {
    return [this.carbs, this.fats, this.proteins];
  }
}
