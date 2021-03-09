import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:device_info_example/page/bug_info_page.dart';
import 'package:device_info_example/page/device_info_page.dart';
import 'package:device_info_example/page/package_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title =
      '${Platform.isAndroid ? 'Android' : 'iOS'} Device Info';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.pink),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.email),
          title: Text('Bug Report', style: style),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_device_info),
          title: Text('DeviceInfo', style: style),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outlined),
          title: Text('PackageInfo'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return BugInfoPage();
      case 1:
        return DeviceInfoPage();
      case 2:
        return PackageInfoPage();
      default:
        return Container();
    }
  }
}
