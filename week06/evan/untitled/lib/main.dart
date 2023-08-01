import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _nameController;
  late TextEditingController _birthdayYearController;
  late TextEditingController _birthdayMonthController;
  late TextEditingController _birthdayDayController;
  late TextEditingController _mobileController;
  late TextEditingController _introductionController;
  bool _isFloatingActionButtonVisibility = true;

  List<Friend> _friends = [
    Friend(
        name: 'John',
        gender: Gender.male,
        birthday: "1999/03/03",
        imagePath: 'assets/images/john.png',
        mobile: '1234567890',
        isSmoke: true,
        introduction: 'Hello, I am John.'),
    Friend(
        name: 'Peter',
        gender: Gender.male,
        birthday: "1989/05/02",
        imagePath: 'assets/images/peter.png',
        mobile: '1234567890',
        isSmoke: false,
        introduction: 'Hello, I am Peter.'),
    Friend(
        name: 'Mary',
        gender: Gender.female,
        birthday: "1997/01/12",
        imagePath: 'assets/images/mary.png',
        mobile: '1234567890',
        isSmoke: true,
        introduction: 'Hello, I am Mary.'),
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _birthdayYearController = TextEditingController();
    _birthdayMonthController = TextEditingController();
    _birthdayDayController = TextEditingController();
    _mobileController = TextEditingController();
    _introductionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: _friends.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset(_friends[index].imagePath),
                      title: Text('${_friends[index].name}(${_friends[index].birthday})'),
                      subtitle: Text(_friends[index].introduction),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _friends.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => Visibility(
              visible: _isFloatingActionButtonVisibility,
              child: FloatingActionButton(
                onPressed: () {
                  _showAddFriendDialog(context);
                },
                tooltip: 'Add Friend',
                child: const Icon(Icons.add),
              )),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  _showAddFriendDialog(BuildContext context) {
    setState(() {
      _isFloatingActionButtonVisibility = false;
    });
    showBottomSheet(
      context: context,
      builder: (context) => Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text('추가할 친구 정보를 입력하세요.'),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이름',
                ),
              ),
              Text("생년월일"),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: _birthdayYearController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '연도',
                        hintText: 'YYYY',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: _birthdayMonthController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '월',
                        hintText: 'MM',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: _birthdayDayController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '일',
                        hintText: 'DD',
                      ),
                    ),
                  )
                ],
              ),
              TextField(
                controller: _mobileController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '전화번호',
                  hintText: '010-0000-0000',
                ),
              ),
              TextField(
                controller: _introductionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '자기소개',
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _friends.add(Friend(
                        name: _nameController.text,
                        gender: Gender.male,
                        birthday:
                            "${_birthdayYearController.text}/${_birthdayMonthController.text}/${_birthdayDayController.text}",
                        imagePath: "",
                        mobile: _mobileController.text,
                        isSmoke: false,
                        introduction: _introductionController.text));
                  });

                  _resetControllers();
                  setState(() {
                    _isFloatingActionButtonVisibility = true;
                  });

                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Add Friend'),
              )
            ],
          )),
    );
  }

  void _resetControllers() {
    _nameController.clear();
    _birthdayYearController.clear();
    _birthdayMonthController.clear();
    _birthdayDayController.clear();
    _mobileController.clear();
    _introductionController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthdayYearController.dispose();
    _birthdayMonthController.dispose();
    _birthdayDayController.dispose();
    _mobileController.dispose();
    _introductionController.dispose();
    super.dispose();
  }
}

enum Gender { male, female }

class Friend {
  final String name;
  final Gender gender;
  final String birthday;
  final String imagePath;
  final String mobile;
  final bool isSmoke;
  final String introduction;

  Friend(
      {required this.name,
      required this.gender,
      required this.birthday,
      required this.imagePath,
      required this.mobile,
      required this.isSmoke,
      required this.introduction});
}
