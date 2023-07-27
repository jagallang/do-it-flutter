import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageWidgetApp(),
    );
  }
}

class ImageWidgetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageWidgetApp();
}

class _ImageWidgetApp extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Image Widget')),
        body: ListView(children: [
          Container(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Image test 입니다",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      color: Colors.blue)),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.none,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/flutter_logo.jpeg',
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          )))
        ]));
  }
}
