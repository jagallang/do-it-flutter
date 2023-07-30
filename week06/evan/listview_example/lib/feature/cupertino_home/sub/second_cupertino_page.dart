import 'package:flutter/cupertino.dart';

import '../../../model/animtal.dart';

class SecondCupertinoPage extends StatefulWidget {
  final List<Animal> animalList;

  const SecondCupertinoPage({Key? key, required this.animalList})
      : super(key: key);

  @override
  State<SecondCupertinoPage> createState() => _SecondCupertinoPageState();
}

class _SecondCupertinoPageState extends State<SecondCupertinoPage> {
  late TextEditingController _textEditingController;
  int _kindChoice = 0;
  bool _flyExist = false;
  String _imagePath = '';

  Map<int, Widget> segmentWidgets = {
    0: SizedBox(
      child: Text('양서류'),
      width: 80,
    ),
    1: SizedBox(
      child: Text('파충류'),
      width: 80,
    ),
    2: SizedBox(
      child: Text('포유류'),
      width: 80,
    )
  };

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('동물 추가'),
        ),
        child: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoTextField(
                    controller: _textEditingController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    placeholder: '동물 이름을 입력하세요.'),
              ),
              CupertinoSegmentedControl(
                children: segmentWidgets,
                groupValue: _kindChoice,
                onValueChanged: (value) {
                  setState(() {
                    _kindChoice = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('날개가 존재합니까?'),
                  CupertinoSwitch(
                    value: _flyExist,
                    onChanged: (value) {
                      setState(() {
                        _flyExist = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'images/cow.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/cow.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/pig.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/pig.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/bee.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/bee.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/cat.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/cat.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/dog.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/dog.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/fox.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/fox.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/monkey.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/monkey.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/wolf.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          _imagePath = 'images/wolf.png';
                        },
                      ),
                      CupertinoButton(
                        child: Text('동물 추가하기'),
                        onPressed: (){
                          if(_imagePath.isEmpty || _textEditingController.text.isEmpty) {
                           var message = "";
                            if(_imagePath == null) {
                              message = "동물 사진을 선택하세요.";
                            } else if(_textEditingController.text == null || _textEditingController.text.isEmpty) {
                              message = "동물 이름을 입력하세요.";
                            }
                            showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
                              title: Text('경고'),
                              content: Text(message),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('확인'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));

                            return;
                          }
                          widget.animalList.add(Animal(
                            animalName: _textEditingController.text,
                            kind: _getKind(_kindChoice),
                            imagePath: _imagePath,
                            flyExist: _flyExist
                          ));
                        },
                      )
                    ],
                  ))
            ],
          )),
        ));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  _getKind(int kindChoice) {
    switch (kindChoice) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }
}
