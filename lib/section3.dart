import 'dart:io';

void main() {
  print("Section 3");
  print("=== Student Grades Management System ===");
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  collectStudentsData(studentNames, studentGrades);
  startMenu(studentNames, studentGrades);
}

// ================= Data Collection =================

void collectStudentsData(
    List<String> names, List<List<double>> gradesList) {
  int numStudents = readInt("Enter number of students: ");

  for (int i = 0; i < numStudents; i++) {
    print("\nStudent ${i + 1}:");

    String name = readString("Enter student name: ");
    names.add(name);

    int numSubjects = readInt("Enter number of subjects: ");

    List<double> grades = [];

    for (int j = 0; j < numSubjects; j++) {
      double grade =
          readDouble("Enter grade for subject ${j + 1}: ");
      grades.add(grade);
    }

    gradesList.add(grades);
  }
}

// ================= Menu =================

void startMenu(List<String> names, List<List<double>> gradesList) {
  while (true) {
    print("\n===== MENU =====");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    int choice = readInt("Enter your choice: ");

    handleMenuChoice(choice, names, gradesList);
  }
}

void handleMenuChoice(
    int choice, List<String> names, List<List<double>> gradesList) {
  switch (choice) {
    case 1:
      showAllResults(names, gradesList);
      break;

    case 2:
      searchStudent(names, gradesList);
      break;

    case 3:
      print("Exiting program...");
      exit(0);

    default:
      print("Invalid choice! Try again.");
  }
}

// ================= Features =================

void showAllResults(
    List<String> names, List<List<double>> gradesList) {
  print("\n--- All Results ---");

  for (int i = 0; i < names.length; i++) {
    double avg = calculateAverage(gradesList[i]);
    String grade = getLetterGrade(avg);

    print(
        "${names[i].toUpperCase()} | Avg: ${avg.toStringAsFixed(2)} | Grade: $grade");
  }
}

void searchStudent(
    List<String> names, List<List<double>> gradesList) {
  String searchName =
      readString("Enter student name to search: ");

  for (int i = 0; i < names.length; i++) {
    if (names[i].toLowerCase() ==
        searchName.toLowerCase()) {
      double avg = calculateAverage(gradesList[i]);

      print("Found: ${names[i]}");
      print("Average (rounded): ${avg.round()}");
      return;
    }
  }

  print("Student not found!");
}

// ================= Calculations =================

double calculateAverage(List<double> grades) {
  double sum = grades.reduce((a, b) => a + b);
  return sum / grades.length;
}

String getLetterGrade(double avg) {
  if (avg >= 85) return "A";
  if (avg >= 70) return "B";
  if (avg >= 60) return "C";
  return "F";
}

// ================= Input Helpers =================

int readInt(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    int? value = int.tryParse(input ?? "");
    if (value != null && value > 0) return value;

    print("Invalid input! Please enter a valid positive integer.");
  }
}

double readDouble(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    double? value = double.tryParse(input ?? "");
    if (value != null && value >= 0 && value <= 100) return value;

    print("Invalid input! Enter a number between 0 and 100.");
  }
}

String readString(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }

    print("Invalid input! Please enter a valid name.");
  }
}