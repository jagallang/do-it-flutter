import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("createState");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyApp> {
  String test = 'Hello';
  Color _color = Colors.blue;

  // 생성: createState() 호출된 이후 true가 된다.
  // 소멸: mounted가 false가 되면 dispose되었다는 것을 의미하고 State를 재사용할 수 없다.
  // 이 떄는 dispose()가 호출된 이후이며, setState를 사용하면 에러가 난다.
  @override
  bool get mounted {
    print("mounted: ${super.mounted}");
    return super.mounted;
  }

  @override
  void initState() {
    print("initState");
    super.initState();
    // 서버에서 데이터를 받아오는 등의 초기값 세팅 가능
    // _getJsonData();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text('$test'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_color)),
                  onPressed: () {
                    // mounted 속성이 true라는 것은 위젯을 제어할 수 있는 buildContext 클래스에 접근할 수 있다는 의미.
                    // buildContext가 활성화되어야 setState() 함수를 쓰는 게 안전하다.
                    if (mounted) {
                      if (_color == Colors.blue) {
                        setState(() {
                          test = 'Flutter';
                          _color = Colors.amber;
                        });
                      } else {
                        setState(() {
                          test = 'Hello';
                          _color = Colors.blue;
                        });
                      }
                    }
                  }))),
    );
  }

  // iniState()는 처음 한 번 호출된다면, didUpdateWidget()은 widget의 변경이 있을 때마다 호출된다.
  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
    // if (oldWidget.importantProperty != widget.importantProperty) {
    //   갱신될 때마다 초기화가 필요하다면, 따로 함수를 만들어 호출하도록 함
    //   _init();
    // }
  }

  void updateProfile(String name) {
    // setState()는 State<T>를 상속받은 클래스 어느 곳에든지 사용 가능하다.
    setState(() {
      test = name;
    });
  }

  // State 객체가 플러터의 구성 트리로부터 제거될 때 호출된다.
  // 주의: State 객체가 제거되는 것은 메모리 상에서 혹은 해당 위젯이 화면에서 사라지는 것을 의미하지 않는다
  // dispose() 함수 호출 전까지 State 객체를 재사용할 수 있다.
  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  // === THE END ===
  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }
}
