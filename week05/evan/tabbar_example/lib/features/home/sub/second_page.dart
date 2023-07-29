import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Center(
            child: Text("두 번 째 페이지"),
          ),
        ));
  }
}
