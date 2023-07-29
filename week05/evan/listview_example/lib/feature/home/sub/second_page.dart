import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/animtal.dart';

class SecondPage extends StatelessWidget {
  final List<Animal> animals;

  SecondPage({Key? key, required this.animals}) : super(key: key);

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
        )
    );
  }
}