// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int inPutText = 0;
  var operator = "";
  var input_1 = "";
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('내 계산기'),
      ),
      body: Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.only(right: 72),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              TextField(
                controller: inputController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        inputController.text = inputController.text
                            .substring(0, inputController.text.length - 1);
                      },
                      child: Text('<-')),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                  child: Text('1'),
                  onPressed: () {
                    inputController.text = inputController.text + "1";
                  }),
              ElevatedButton(
                  child: Text('2'),
                  onPressed: () {
                    inputController.text = inputController.text + "2";
                  }),
              ElevatedButton(
                  child: Text('3'),
                  onPressed: () {
                    inputController.text = inputController.text + "3";
                  }),
              ElevatedButton(
                  child: Text('x'),
                  onPressed: () {
                    operator = "x";
                    input_1 = inputController.text;
                    inputController.text = "";
                    setState(() {});
                  })
            ],
          ),
          Row(children: [
            ElevatedButton(
                child: Text('4'),
                onPressed: () {
                  inputController.text = inputController.text + "4";
                }),
            ElevatedButton(
                child: Text('5'),
                onPressed: () {
                  inputController.text = inputController.text + "5";
                }),
            ElevatedButton(
                child: Text('6'),
                onPressed: () {
                  inputController.text = inputController.text + "6";
                }),
            ElevatedButton(
                child: Text('/'),
                onPressed: () {
                  operator = "/";
                  input_1 = inputController.text;
                  inputController.text = "";
                  setState(() {});
                })
          ]),
          Row(children: [
            ElevatedButton(
                child: Text('7'),
                onPressed: () {
                  inputController.text = inputController.text + "7";
                }),
            ElevatedButton(
                child: Text('8'),
                onPressed: () {
                  inputController.text = inputController.text + "8";
                }),
            ElevatedButton(
                child: Text('9'),
                onPressed: () {
                  inputController.text = inputController.text + "9";
                }),
            ElevatedButton(
                child: Text('+'),
                onPressed: () {
                  operator = "+";
                  input_1 = inputController.text;
                  inputController.text = "";
                  setState(() {});
                })
          ]),
          Row(children: [
            ElevatedButton(
                child: Text('0'),
                onPressed: () {
                  inputController.text = inputController.text + "0";
                }),
            ElevatedButton(
                child: Text('C'),
                onPressed: () {
                  inputController.text = inputController.text = "";
                }),
            ElevatedButton(
                child: Text('-'),
                onPressed: () {
                  operator = "-";
                  input_1 = inputController.text;
                  inputController.text = "";
                  setState(() {});
                }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('='),
              onPressed: () {
                if (operator == "+") {
                  var sum = double.parse(input_1) +
                      double.parse(inputController.text);
                  inputController.text = sum.toString();
                  setState(() {});
                }
                if (operator == "-") {
                  var sum = double.parse(input_1) -
                      double.parse(inputController.text);
                  inputController.text = sum.toString();
                  setState(() {});
                }
                if (operator == "x") {
                  var sum = double.parse(input_1) *
                      double.parse(inputController.text);
                  inputController.text = sum.toString();
                  setState(() {});
                }
                if (operator == "/") {
                  var sum = double.parse(input_1) /
                      double.parse(inputController.text);
                  inputController.text = sum.toString();
                  setState(() {});
                }
              },
            )
          ])
        ]),
      ),
    );
  }
}
