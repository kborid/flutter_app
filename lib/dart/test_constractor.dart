class Person {
  var name;
  var address;

  Person(this.name, this.address) : assert(null != name);

  @override
  String toString() {
    return 'Person{name: $name, address: $address}';
  }
}
