void main() {}

abstract class Car {
  String name;
  String color;
  int speed;
  int maxSpeed;
  int minSpeed;
  bool isRunning;

  Car(this.name, this.color, this.speed, this.maxSpeed, this.minSpeed,
      this.isRunning);

  void start();
}

class BabyBenz extends BENZ {
  BabyBenz(String name, String color, int speed, int maxSpeed, int minSpeed,
      bool isRunning)
      : super(name, color, speed, maxSpeed, minSpeed, isRunning);
  
  @override
  void start() {
    print("Hello2");
  }
}

class BENZ extends Car {
  BENZ(String name, String color, int speed, int maxSpeed, int minSpeed,
      bool isRunning)
      : super(name, color, speed, maxSpeed, minSpeed, isRunning);

  @override
  void start() {
    print("Hello");
  }
}

class MORNING extends Car {
  MORNING(String name, String color, int speed, int maxSpeed, int minSpeed,
      bool isRunning)
      : super(name, color, speed, maxSpeed, minSpeed, isRunning);

  @override
  void start() {
    isRunning = true;
  }

  @override
  void stop() {
    isRunning = false;
  }

  @override
  void accelerate() {
    if (isRunning) {
      speed += 5;
      if (speed > maxSpeed) {
        speed = maxSpeed;
      }
    }
  }

  @override
  void decelerate() {
    if (isRunning) {
      speed -= 5;
      if (speed < minSpeed) {
        speed = minSpeed;
      }
    }
  }
}
