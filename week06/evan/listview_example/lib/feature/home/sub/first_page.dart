import 'package:flutter/material.dart';

import '../../../model/animtal.dart';

class FirstPage extends StatelessWidget {
  final List<Animal> animals;

  const FirstPage({Key? key, required this.animals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          child: Center(
            child: ListView.builder(
                itemCount: animals.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                    child: Card(
                        child: Row(
                      children: [
                        Image.asset(
                          animals[position].imagePath,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          '${animals[position].animalName}',
                          style: TextStyle(fontSize: 30.0),
                        )
                      ],
                    )),
                    onTap: () {
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '이 동물은 ${animals[position].kind}입니다.',
                          style: TextStyle(fontSize: 30.0),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('종료'))
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog);
                    },
                  );
                }),
          ),
        ));
  }
}
