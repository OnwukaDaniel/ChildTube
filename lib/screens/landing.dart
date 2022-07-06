import 'dart:collection';

import 'package:child_tube/screens/add.dart';
import 'package:child_tube/screens/channel.dart';
import 'package:child_tube/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool hasFragment = false;
  late BuildContext _c1;
  late BuildContext _c2;
  late BuildContext _c3;
  late BuildContext _c4;
  late BuildContext _c5;

  final Queue<BuildContext> _queue = Queue();
  final List<String> tabKeyList = ["_c1"];
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    //_c1 = navigatorKey.currentContext!;
    //Navigator.of(_c1).pushReplacementNamed("home");
    //_queue.addLast(_c1);

    Widget app = MaterialApp(
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      })),
      initialRoute: "home",
      routes: <String, WidgetBuilder>{
        "home": (BuildContext context) => Home(),
        "menu": (BuildContext context) => Menu(),
        "channel": (BuildContext context) => Channel(),
        "add": (BuildContext context) => Add(),
        "search": (BuildContext context) => Home(),
      },
      navigatorKey: navigatorKey,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _c1 = navigatorKey.currentContext!;
                Navigator.of(_c1).pushReplacementNamed("home");
                _queue.addLast(_c1);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/home.png"),
              ),
            ),
            IconButton(
              onPressed: () {
                _c2 = navigatorKey.currentContext!;
                Navigator.of(_c2).pushReplacementNamed("search");
                _queue.addLast(_c2);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/search.png"),
              ),
            ),
            IconButton(
              onPressed: () {
                _c3 = navigatorKey.currentContext!;
                Navigator.of(_c3).pushReplacementNamed("add");
                _queue.addLast(_c3);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/add.png"),
              ),
            ),
            IconButton(
              onPressed: () {
                _c4 = navigatorKey.currentContext!;
                Navigator.of(_c4).pushReplacementNamed("channel");
                _queue.addLast(_c4);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/list.png"),
              ),
            ),
            IconButton(
              onPressed: () {
                _c5 = navigatorKey.currentContext!;
                Navigator.of(_c5).pushReplacementNamed("menu");
                _queue.addLast(_c5);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/menu.png"),
              ),
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_queue.isNotEmpty) {
            Navigator.of(_queue.removeLast()).pop();
            return false;
          }
          return true;
        },
        child: app,
      ),
    );
  }
}
