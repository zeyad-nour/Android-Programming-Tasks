// ================= Part 2: Manage Student Courses =================
Map<String, Map<String, double>> studentCourses = {};

// Function to add a course to a student
void addCourse(String studentName, String courseName, {double grade = 0}) {
  if (!studentCourses.containsKey(studentName)) {
    studentCourses[studentName] = {};
  }
  studentCourses[studentName]![courseName] = grade;
}

// Function to calculate average grade of a student
double averageGrade(String studentName) {
  if (!studentCourses.containsKey(studentName) ||
      studentCourses[studentName]!.isEmpty) {
    return 0;
  }

  var grades = studentCourses[studentName]!.values.toList();
  // Higher-order function with lambda
  return grades.reduce((a, b) => a + b) / grades.length;
}

// Example usage
void exampleCourses() {
  addCourse("Ali", "Math", grade: 90);
  addCourse("Ali", "Physics", grade: 80);
  addCourse("Mona", "Math", grade: 95);
  addCourse("Mona", "Chemistry", grade: 85);

  print("\nAverage grades:");
  studentCourses.forEach((name, courses) {
    print("$name: ${averageGrade(name).toStringAsFixed(2)}");
  });
}

// Run example for Part 2
void runPart2() {
  exampleCourses();
}