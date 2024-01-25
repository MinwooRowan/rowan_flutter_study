import '2_class.dart';

void main() {
  // const
  // final
  // static
  // dynamic
  // var

  // Primitive Type
  final int integer = 10;
  final double decimal = 10.5;
  final bool boolean = true;

  integer.toDouble(); // double
  integer.toString(); // string
  integer.isEven; // bool
  integer.isOdd; // bool

  decimal.toInt(); // int
  decimal.toString(); // string
  decimal.floor(); // int
  decimal.ceil(); // int
  decimal.truncateToDouble();

  // String, List, Map
  final String string = 'Hello World';

  string.isEmpty; // bool
  string.length; // int
  string.contains('Hello'); // bool
  string.substring(0, 5); // string
  string.toUpperCase(); // string
  string.toLowerCase(); // string
  string.split(' '); // List<String>
  final String replaceString = string.replaceAll('Hello', 'Hi'); // string

  print(string);
  print(replaceString);

  // List == Array
  // List<int> 와 같이 타입을 명시해줘야 한다.
  // 타입 명시 안해도 넣을 수 있지만 컴파일 단계에서 디버깅 불가능.
  final List<int> list1 = [];
  final List<int> list2 = [1, 2, 3, 4, 5];

  // list0는 assign되어 있지 않으므로 null이다.
  final List<int> list0;

  // 아래처럼 값을 assign해줘야 한다.
  list0 = [1, 2, 3, 4, 5];

  final List<int> integerList = List.generate(10, (index) {
    return index;
  });
  // 0,1,3,4,5,6,7,8,9

  // Primitive 타입 외에도
  final List<Person> people = [
    Person('John', 20, 'Solo'),
    Person('Jane', 21, 'Couple'),
  ];

  // Like json
  // List와 마찬가지로 Generic으로 타입 명시 해줘야 한다.
  final Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  // map['one'] = 1;
  // map['two'] = 2;
  // map['three'] = 3;
}
