import 'package:flutter/cupertino.dart';

import '../../../model/animtal.dart';

class FirstCupertinoPage extends StatefulWidget{
  final List<Animal> animalList;

  const FirstCupertinoPage({Key? key, required this.animalList}) : super(key: key);

  @override
  State<FirstCupertinoPage> createState() => _FirstCupertinoPageState(animalList: animalList);
}

class _FirstCupertinoPageState extends State<FirstCupertinoPage> {
  List<Animal> animalList;

  _FirstCupertinoPageState({required this.animalList});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: ListView.builder(
      itemCount: animalList.length,
        itemBuilder: (context, index){
      return Container(
        padding: EdgeInsets.all(5),
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  animalList[index].imagePath,
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80
                ),
                Text(animalList[index].animalName)
              ]
            ),
            Container(
              height: 2,
              color: CupertinoColors.black,
            )
          ],
        )
      );
    }));
  }
}