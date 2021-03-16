class Parent {
  String name;

  methodParent() {
    print("methodParent");
  }
}

class A {
  methodA() {
    print("methodA");
  }
}

class B {
  methodB() {
    print("methodB");
  }
}

class C extends Parent with A, B {}

class D extends Parent implements A, B {
  @override
  methodA() {
    print("invoke methodA() in D");
  }

  @override
  methodB() {
    print("invoke methodB() in D");
  }

}

main() {
  D c = D();
  c.methodParent();
  c.methodA();
  c.methodB();
}