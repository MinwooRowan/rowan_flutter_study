class Person {
  final String name;
  final int age;
  final String _status;

  void printPersonalInfo() {
    print(_status);
  }

  void printLover({required String loverName}) {
    print('$name love $loverName');
    // print('LoverName has ${loverName.length} characters');
  }

  void printLover2({required int day, String maybeNotLover = 'No Lover'}) {
    print('$name love $maybeNotLover');
    print('$name love $maybeNotLover for $day days');
    print('LoverName has ${maybeNotLover.length} characters');
  }

  Future<void> printNameAfterDelayed() async {
    await Future.delayed(Duration(seconds: 1));
    print(this.name);
  }

  Future<int> getAgeAfterDelayed() async {
    await Future.delayed(Duration(seconds: 1));
    return this.age;
  }

  Person(
    this.name,
    this.age,
    this._status,
  );
}

class Company {
  final String name;
  final List<Person> employees;

  Company(this.name, this.employees) {
    printEmployees();
  }

  void printEmployees() {
    for (final employee in employees) {
      print(employee.name);
    }
  }
}

void main() {
  final Person person = Person('John', 20, 'Solo');
  final Person person2 = Person('Jane', 21, 'Couple');

  // person.printLover(loverName: 'Jane');
  // person.printLover2(day: 100);
  // person.printLover2(day: 100, maybeNotLover: 'Jane');

  final Company company = Company('Google', [person, person2]);
  // company.printEmployees();

  person.printNameAfterDelayed();
  person.getAgeAfterDelayed().then((value) => print(value));
}
