class Animal {
  String name;
  Animal(this.name);
  void eat() {
    print("$name is eating");
  }
}

// Dart에서는 다중 상속을 지원하지 않는다.
class Cat extends Animal implements Mammalia {
  Cat(String name) : super(name);
  void meow() {
    print("$name is meowing");
  }

  @override
  void feed() {
    print("$name is feeding");
  }
}

// Dart에서는 따로 인터페이스를 정의하지 않고, 추상 클래스를 사용한다.
abstract class Mammalia {
  void feed();
}

void main() {
  final Cat cat = Cat('Nabi');
  cat.eat();
  cat.meow();
  cat.feed();
}
