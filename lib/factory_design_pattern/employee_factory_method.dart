import 'package:flutter/cupertino.dart';

//   @override
//   void initState() {
//     Employee employee = Employee(EmployeeType.programmer);
//     Employee employee2 = EmployeeFactoryMethod.getEmployeeType('teacher');
//     employee2.work();
//     employee.work();
//     super.initState();
//   }
//  and this is how to create the object of the factory method class and assign an object dynamically

enum EmployeeType {
  programmer,
  boss,
  teacher,
}

abstract class Employee {
  void work();

  factory Employee(EmployeeType type) {
    switch (type) {
      case EmployeeType.programmer:
        return Programmer();
      case EmployeeType.boss:
        return Boss();
      case EmployeeType.teacher:
        return Teacher();
      default:
        return Programmer();
    }
  }
}

class Programmer implements Employee {
  @override
  void work() {
    debugPrint('programmer started here');
  }
}

class Boss implements Employee {
  @override
  void work() {
    debugPrint('Boss started here');
  }
}

class Teacher implements Employee {
  @override
  void work() {
    debugPrint('teacher started here');
  }
}

class EmployeeFactoryMethod {
  // it is not necessary to mentioned the factory keyword to make the factory design pattern method

  static Employee getEmployeeType(String type) {
    switch (type) {
      case 'programmer':
        return Programmer();
      case 'boss':
        return Boss();
      case 'teacher':
        return Teacher();
      default:
        return Programmer();
    }
  }
}
