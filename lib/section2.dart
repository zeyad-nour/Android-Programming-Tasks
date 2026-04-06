import 'dart:math';

void main() {
   print("Section 2");
  //  Generate random degree
  int degree = Random().nextInt(101); // 0 to 100 inclusive
  print("Degree: $degree");

  //  Convert to grade
  String grade = getGrade(degree);
  print("Grade: $grade");
}

// ================= Function to convert degree to grade =================
String getGrade(int degree) {
  // Nested if statements
  if (degree >= 95 && degree <= 100) return "+A";
  else if (degree >= 90) return "A";
  else if (degree >= 85) return "+B";
  else if (degree >= 80) return "B";
  else if (degree >= 75) return "+C";
  else if (degree >= 70) return "C";
  else if (degree >= 65) return "+D";
  else if (degree >= 60) return "D";
  else return "F";
}