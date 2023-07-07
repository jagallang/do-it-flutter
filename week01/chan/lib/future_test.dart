void main(){
  checkVersion();
  checkVersion2();
  checkVersion3();
  print('end process');
  // Future를 왜 써야하냐???
}

Future checkVersion() async {
  print('Waiting...1');
  await Future.delayed(const Duration(milliseconds: 100), () {
    print('Calling...1');
    var version = lookUpVersion();
    print(version);
  });
  await Future.delayed(const Duration(microseconds: 200), () {
    print('Calling...1-1');
  });
  await Future.delayed(const Duration(microseconds: 50), () {
    print('Calling...1-2');
  });
  print('Done1!');
}

Future checkVersion2() async {
  print('Waiting...2');
  await Future.delayed(const Duration(milliseconds: 100), () {
    print('Calling...2');
    var version = lookUpVersion();
    print(version);
  });
  print('Done2!');
}

Future checkVersion3() async {
  print('Waiting...3');
  await Future.delayed(const Duration(milliseconds: 100), () {
    print('Calling...3');
    var version = lookUpVersion();
    print(version);
  });
  print('Done3!');
}


int lookUpVersion(){
  return 12;
}