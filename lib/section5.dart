
abstract class Skills {
  void programming();
  void communication();
}

class Person {
  String name;
  int _age; 

  static String universityName = "Sohag University";

  Person(this.name, this._age);


  int get age => _age;

 
  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }
}


class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("Employee Info:");
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}

class Developer extends Employee implements Skills {
  String language;

  Developer(String name, int age, double salary, this.language)
      : super(name, age, salary);

  @override
  void programming() {
    print("$name is programming using $language");
  }

  @override
  void communication() {
    print("$name is communicating with team effectively");
  }
}

void main() {
  Developer dev = Developer("Zeyad", 21, 15000, "Dart");

  dev.showInfo();
  dev.programming();
  dev.communication();

  print("University: ${Person.universityName}");
}