class Utility {
  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static String capitalize(String? s) {
    if (s == null) {
      return "";
    }
    return "${s[0].toUpperCase()}${s.substring(1)}";
  }
}
