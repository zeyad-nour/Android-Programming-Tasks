void main() {
  // ================= Part 1: Manage Student Names =================
  Set<String> students = {};

  // Add students
  addStudent(students, "Ali");
  addStudent(students, "Mona");
  addStudent(students, "Zeyad");
  addStudent(students, "Ali"); // duplicate, will be ignored

  print("Students (recursive):");
  printStudentsRecursive(students.toList(), 0);

  print("\nStudents (lambda forEach):");
  students.forEach((s) => print(s));

  // Merge with new set using spread operator
  Set<String> newStudents = {"Sara", "Mona", "Omar"};
  students = {...students, ...newStudents};

  print("\nAfter merging with new students:");
  students.forEach((s) => print(s));
}

// Function to add student to set
void addStudent(Set<String> students, String name) {
  students.add(name);
}

// Recursive function to print students
void printStudentsRecursive(List<String> studentsList, int index) {
  if (index >= studentsList.length) return;
  print(studentsList[index]);
  printStudentsRecursive(studentsList, index + 1);
}