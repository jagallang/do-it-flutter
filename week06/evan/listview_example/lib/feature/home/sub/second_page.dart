import 'package:flutter/material.dart';

import '../../../model/animtal.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> animals;

  SecondPage({Key? key, required this.animals}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SecondPageState(animals);
}

class SecondPageState extends State<SecondPage> {
  List<Animal> _animals;
  final _nameController = TextEditingController();
  int _radioValue = 0;
  bool _flyExists = false;
  late String _imagePath;

  SecondPageState(this._animals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '동물 이름을 입력하세요.',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('양서류'),
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('파충류'),
                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('포유류'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('날 수 있나요?'),
                  Checkbox(
                      value: _flyExists,
                      onChanged: (check) {
                        setState(() {
                          _flyExists = check ?? false;
                        });
                      })
                ],
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      child: Image.asset('images/bee.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/cat.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/cow.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/dog.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/dog.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/fox.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/monkey.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/monkey.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/pig.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('images/wolf.png', width: 80),
                      onTap: () {
                        _imagePath = 'images/wolf.png';
                      },
                    ),
                  ],
                ),
              ),
                  ElevatedButton(
                    onPressed: (){
                      if(_nameController.value.text.isEmpty){
                        showSnackBar(context, '동물 이름을 입력하세요.');
                        return;
                      }
                      if(_imagePath.isEmpty){
                        showSnackBar(context, '동물 사진을 선택하세요.');
                        return;
                      }

                      var animal = Animal(
                        animalName: _nameController.value.text,
                        kind: _getKind(_radioValue),
                        imagePath: _imagePath,
                        flyExist: _flyExists
                      );
                      AlertDialog dialog = AlertDialog(
                        title: Text('동물 추가하기'),
                        content: Text(
                          '이 동물은 ${animal.animalName}입니다.'
                          '또 이 동물의 종류는 ${animal.kind}입니다.\n이 동물을 추가하시겠습니까?',
                          style: TextStyle(fontSize: 30.0),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                widget.animals.add(animal);
                                Navigator.of(context).pop();
                              },
                              child: Text('예')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('아니오'))
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog
                      );
                    },
                    child: Text('동물 추가하기'),
                  )
            ]),
          ),
        ));
  }

  _radioChange(int? value) {
    setState(() {
      _radioValue = value ?? 0;
    });
  }

  _getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }
}
