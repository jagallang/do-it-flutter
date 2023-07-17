void main() {
  var bmw = BMW();
  var benz = BENZ();
  var ford = FORD();

  print("BMW: ${bmw.saleCar()}");
  print("BENZ: ${benz.saleCar()}");
  print("FORD: ${ford.saleCar()}");
}

abstract class Car {
  int _maxSpeed = 0;
  int _price = 0;
  String _name = "";

  double saleCar() => (_price * 0.9);
}

class BMW extends Car {
  BMW() {
    _maxSpeed = 320;
    _price = 100000;
    _name = "BMW";
  }
}

class BENZ extends Car {
  BENZ() {
    _maxSpeed = 250;
    _price = 70000;
    _name = "BENZ";
  }
}

class FORD extends Car {
  FORD() {
    _maxSpeed = 200;
    _price = 70000;
    _name = "FORD";
  }
}