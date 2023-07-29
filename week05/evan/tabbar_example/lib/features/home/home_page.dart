import 'package:flutter/material.dart';
import 'package:tabbar_example/features/home/sub/first_page.dart';
import 'package:tabbar_example/features/home/sub/second_page.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      print('tabController.index: ${tabController.indexIsChanging}');
      print('tabController.index: ${tabController.previousIndex}');
      print('tabController.index: ${tabController.index}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.green,
        ),
        body: TabBarView(
          controller: tabController,
          children: [FirstPage(), SecondPage()],
        ),
        bottomNavigationBar: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
            Tab(icon: Icon(Icons.looks_two, color: Colors.blue)),
          ],
        ));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
