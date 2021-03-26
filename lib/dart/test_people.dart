
import 'package:kborid_flutter/dart/test_abstract_people.dart';

class TestPeople with People {
  @override
  void say() {
    super.say();
    print("test say()");
  }

  @override
  void walk() {}

  @override
  void eat() {}

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  void main() {
    TestPeople testPeople = new TestPeople();
    testPeople.say();
  }
}
