import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

abstract class Animal {
  String name;
  Animal(this.name);
  void move() {}
  breath() {
    print('$name can breath');
  }
}

class Bird extends Animal {
  Bird(name) : super(name);
  fly() {
    print('$name can fly');
  }

  @override
  breath() {
    // TODO: implement breath
    print('$name can be breathing');
  }

  @override
  void move() {
    print('$name am grute');
  }
}

class Fish extends Animal {
  Fish(name) : super(name);
  @override
  move() {
    print('$name doing good');
  }
}

class MyAppState extends State<MyApp> {
  String test = 'hello';
  List<Animal> animals = [];

  handleButtonPress() {
    Bird example = Bird('dog');
    example.breath();

    example.move(); //  클래스인 ExampleClass의 메서드를 호출
  }

  extendedMethod() {
    Bird birdextended = Bird('');
    birdextended.fly();
    birdextended.breath();
  }

  void callFunctionWithParameters(int index) {
    Animal animalFromList = animals[index];
    animalFromList.move();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: null,
            onPressed: () {
              animals.add(Bird('Sparrow'));
              animals.add(Fish('Salmon'));
              callFunctionWithParameters(1);
            },
          ),
        ),
      ),
    );
  }
}
