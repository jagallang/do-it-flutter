import 'package:flutter/material.dart';
import 'package:listview_example/feature/home/sub/first_page.dart';
import 'package:listview_example/feature/home/sub/second_page.dart';

import '../../model/animtal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
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

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview Page'),
          backgroundColor: Colors.amber,
        ),
        body: TabBarView(
          controller: controller,
          children: [
            FirstPage(animals: animalList),
            SecondPage(animals: animalList),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: controller,
          tabs: [
            Tab(
              icon: Icon(Icons.looks_one),
              text: 'First',
            ),
            Tab(
              icon: Icon(Icons.looks_two),
              text: 'Second',
            ),
          ],
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.amber,
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
