import 'package:flutter/cupertino.dart';
import 'package:listview_example/feature/cupertino_home/sub/first_cupertino_page.dart';
import 'package:listview_example/feature/cupertino_home/sub/second_cupertino_page.dart';

import '../../model/animtal.dart';

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomeState();
}

class _CupertinoHomeState extends State<CupertinoHomePage> {
  late CupertinoTabBar _tabBar;
  List<Animal> animalList = [
    Animal(imagePath: 'images/bee.png', animalName: '벌', kind: '곤충'),
    Animal(imagePath: 'images/cat.png', animalName: '고양이',  kind: '포유류'),
    Animal(imagePath: 'images/cow.png', animalName: '소', kind: '포유류'),
    Animal(imagePath: 'images/dog.png', animalName: '강아지', kind: '포유류'),
    Animal(imagePath: 'images/fox.png', animalName: '여우', kind: '포유류'),
    Animal(imagePath: 'images/monkey.png', animalName: '원숭이', kind: '포유류'),
    Animal(imagePath: 'images/pig.png', animalName: '돼지', kind: '포유류'),
    Animal(imagePath: 'images/wolf.png', animalName: '늑대', kind: '포유류')
  ];

  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _tabBar = CupertinoTabBar(items: [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(tabBar: _tabBar, tabBuilder: (context, index) {
      if(index == 0) {
        return FirstCupertinoPage(animalList: animalList);
      } else {
        return SecondCupertinoPage(animalList: animalList);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}