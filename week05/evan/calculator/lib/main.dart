import 'package:calculator/widgets/buttons/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Operator { EMPTY, ADD, SUBTRACT, MULTIPLY, DIVIDE, PERCENT }

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  Operator _currentOperator = Operator.EMPTY;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Row(
            children: [
              Icon(Icons.menu),
              Expanded(child: Text('일반 계산기')),
              Icon(Icons.history),
              Icon(Icons.more_vert)
            ],
          ),
        ),
        body: Column(children: [
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        _controller.text,
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Row(children: [
                        IconButton(
                            padding: EdgeInsets.only(left: 50, right: 100),
                            onPressed: () {},
                            icon: Icon(
                                size: 50,
                                Icons.more_horiz_sharp,
                                color: Colors.indigo)),
                        Text('^',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo))
                      ]),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            padding: EdgeInsets.only(right: 70),
                            icon: Icon(
                              size: 50,
                              CupertinoIcons.delete_left_fill,
                              color: Colors.indigo,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.text = _controller.text
                                    .substring(0, _controller.text.length - 1);
                              });
                            },
                          )),
                    ],
                  )
                ],
              )),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: (itemWidth / itemHeight) * 2,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(2.0),
                crossAxisSpacing: 4.0,
                // Add spacing between the buttons.
                mainAxisSpacing: 4.0,
                // Add spacing between the buttons.
                scrollDirection: Axis.vertical,
                children: [
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          _controller.text = '';
                        });
                      },
                      child: Text('C',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          // no-op
                        });
                      },
                      child: Text('( )',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          _currentOperator = Operator.PERCENT;
                        });
                      },
                      child: Text('%',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          _currentOperator = Operator.DIVIDE;
                        });
                      },
                      child: Text('÷',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '7');
                      },
                      text: '7'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '8');
                      },
                      text: '8'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '9');
                      },
                      text: '9'),
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          _currentOperator = Operator.MULTIPLY;
                        });
                      },
                      child: Text('×',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '4');
                      },
                      text: '4'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '5');
                      },
                      text: '5'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '6');
                      },
                      text: '6'),
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          _currentOperator = Operator.SUBTRACT;
                        });
                      },
                      child: Text('-',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '1');
                      },
                      text: '1'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '2');
                      },
                      text: '2'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '3');
                      },
                      text: '3'),
                  CalculatorButton(
                      onPressed: () {
                        setState(() {
                          _currentOperator = Operator.ADD;
                        });
                      },
                      child: Text('+',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '0');
                      },
                      text: '0'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '00');
                      },
                      text: '00'),
                  CalculatorButton(
                      onPressed: () {
                        _calculate(_currentOperator, '.');
                      },
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo))),
                  CalculatorButton(
                    onPressed: () {
                      _calculate(_currentOperator, _controller.text);
                      _currentOperator = Operator.EMPTY;
                    },
                    backgroundColor: Colors.indigo,
                    child: Text('=',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          )
        ]));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _calculate(Operator currentOperator, String s) {
    setState(() {
      if (currentOperator == Operator.EMPTY) {
        _controller.text += s;
      } else if (currentOperator == Operator.ADD) {
        _controller.text =
            '${double.parse(_controller.text) + double.parse(s)}';
      } else if (currentOperator == Operator.SUBTRACT) {
        _controller.text =
            '${double.parse(_controller.text) - double.parse(s)}';
      } else if (currentOperator == Operator.MULTIPLY) {
        _controller.text =
            '${double.parse(_controller.text) * double.parse(s)}';
      } else if (currentOperator == Operator.DIVIDE) {
        _controller.text =
            '${double.parse(_controller.text) / double.parse(s)}';
      } else if (currentOperator == Operator.PERCENT) {
        _controller.text =
            '${double.parse(_controller.text) % double.parse(s)}';
      }
      if (_controller.text.endsWith('.0')) {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 2);
      }
      _currentOperator = Operator.EMPTY;
    });
  }
}
