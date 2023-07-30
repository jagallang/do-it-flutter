import 'package:flutter/cupertino.dart';

import 'feature/cupertino_home/cupertino_home_page.dart';

void main() {
  runApp(const MyCupertinoApp());
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemPurple,
      ),
      home: CupertinoHomePage(),
    );
  }
}