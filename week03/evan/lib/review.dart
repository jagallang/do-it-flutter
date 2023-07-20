import 'package:flutter/material.dart';

void main() {
  // example1();
  // example2_1();
  // example2_2();
  // example3();
  // example4();
  example5();
}

example1() {
  print("====== example1");
  printStream();
}

example2_1() {
  print("====== example2_1");
  var target = 10;
  var stream = loopStream(target);
  print("end"); // stream을 listening하는 부분이 없기 때문에 loopStream 내부의 함수는 호출되지 않음.
  // stream.listen((value) {
  //   print(value);
  // });
}

example2_2() {
  print("====== example2_2");
  var target = 10;
  var stream = loopStream(target);
  stream.listen((value) {
    print(value);
  });
  print("end"); // stream을 listening하는 부분이 있기 때문에 loopStream가 동작함
}

example3() {
  print("====== example3: stream with no async+await");
  var target = 10;
  var stream = loopStream(target);
  var sum = sumOfStreamValues(stream);
  print(sum); // await을 하지 않았기에 먼저 호출됨. (Instance of '_Future<int>')
}

example4() async {
  print("====== example4: stream with async+await");
  var target = 10;
  var stream = loopStream(target);
  var sum = await sumOfStreamValues(stream);
  print(sum); // stream 함수 자체는 await을 하지 않지만, 수신하는 모든 비동기 부분에서는 await을 해줘야한다. (sumOfStreamValues 함수 내부에서 await과 sum의 결과를 받기위한 await)
}

Stream<void> printStream() async* {
  for(var i = 0; i < 10; i++) {
    print(i);
    // 아무것도 반환하지 않음. cold stream이기 때문에 호출되지 않으면, 아무것도 일어나지 않음
  }
}

Stream<int> loopStream(int target) async* {
  for(var i = 0; i < target; i++) {
    // 지속적으로 i를 보냄
    print("loopStream: $i");
    yield i;
  }
}

// Stream을 파라미터로 받은 후 await for 루프를 사용하여 Stream의 값을 읽음
Future<int> sumOfStreamValues(Stream<int> stream) async {
  var sum = 0;
  await for(var value in stream) {
    print("sumOfStreamValues: $value");
    sum += value;
  }
  return sum;
}

example5() {
  var benz = Car("Benz", 100, 200);
  var bmw = Car("BMW", 200, 300);
  print(benz.name);
  print(bmw.name);

  var benz2 = Car2(100, "Benz", 200);
  var bmw2 = Car2(200, 300, "BMW");
  print(benz2.name);
  print(bmw2.name);
}

class Car {
  // 여기에서 var나 dynamic을 사용하지 않고 타입을 명확하게 해준다.
  String name;
  int price;
  num maxSpeed;

  Car(this.name, this.price, this.maxSpeed);
}

class Car2 {
  // var나 dynamic을 사용해도 동작에 문제는 없으나, 타입을 명확하게 하지 않으면 원치 않는 데이터가 들어갈 수도 있음.
  var name;
  dynamic price;
  var maxSpeed;

  Car2(this.name, this.price, this.maxSpeed);
}