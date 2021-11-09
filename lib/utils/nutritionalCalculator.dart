import 'package:flaevr/models/AllCalories.dart';
import 'package:flaevr/models/NutritionalQuantity.dart';

class NutritionalCalculator {
  //years, kg, m, (1 - 4) developed for people in the ideal weight
  static double EER(int age, double weight, double height, int levelOfActivity,
      String gender) {
    if (levelOfActivity > 3 || levelOfActivity < 0)
      throw new Exception("Level of activity must be in a range of 0 and 4.");
    if (gender != "M" && gender != "F")
      throw new Exception("String gender must be either M or F.");
    if (weight < 0 || height < 0 || age < 0)
      throw new Exception("All numeric params in EER must be positive.");

    double starter = 0;
    if (age > 18)
      starter = gender == "M" ? 662 : 354;
    else if (age > 3 && age <= 18) starter = gender == "M" ? 88.5 : 135.3;

    double ageMultiplier = 0;
    if (age > 18)
      ageMultiplier = gender == "M" ? 9.53 : 6.91;
    else if (age > 3 && age <= 18) ageMultiplier = gender == "M" ? 61.9 : 30.8;

    double weightMultiplier = 0;
    if (age > 18)
      weightMultiplier = gender == "M" ? 15.91 : 9.36;
    else if (age > 3 && age <= 18)
      weightMultiplier = gender == "M" ? 26.7 : 10.0;

    double heightMultiplier = 0;
    if (age > 18)
      heightMultiplier = gender == "M" ? 539.6 : 726;
    else if (age > 3 && age <= 18) heightMultiplier = gender == "M" ? 903 : 934;

    int bonus = 0;
    if (age > 3 && age <= 18) bonus = age < 9 ? 20 : 25;

    return starter -
        (ageMultiplier * age) +
        (AF(age, gender, levelOfActivity) * (weightMultiplier * weight)) +
        (heightMultiplier * height) +
        bonus;
  }

  static double AF(int age, String gender, int levelOfActivity) {
    if (levelOfActivity > 3 || levelOfActivity < 0)
      throw new Exception("Level of activity must be in a range of 0 and 4.");
    if (gender != "M" && gender != "F")
      throw new Exception("String gender must be either M or F.");

    var yMaleAF = [1.00, 1.13, 1.26, 1.42];
    var yFemaleAF = [1.00, 1.16, 1.31, 1.56];
    var maleAF = [1.00, 1.11, 1.25, 1.48];
    var femaleAF = [1.00, 1.12, 1.27, 1.45];
    if (gender == "M" && age < 19) return yMaleAF[levelOfActivity];
    if (gender == "F" && age < 19) return yFemaleAF[levelOfActivity];
    if (gender == "M" && age > 18) return maleAF[levelOfActivity];
    if (gender == "F" && age > 18) return femaleAF[levelOfActivity];

    return 1.0;
  }

  static double? BEE() {}

  static List<double> gramsCompositionPercentage(
      double total, NutritionalQuantities qt) {
    List<double> ret = [];
    ret.add((100 * qt.carbs) / total);
    ret.add((100 * qt.fats) / total);
    ret.add((100 * qt.proteins) / total);
    ret.add((100 * qt.other) / total);
    return ret;
  }

  static AllCalories caloriesPercentage(
      double total, double carbs, double fats, double proteins) {
    return new AllCalories(
        carbs: carbs * 4,
        fats: fats * 9,
        proteins: proteins * 4,
        other: total - ((carbs * 4) + (fats * 9) + (proteins * 4)));
  }
}
