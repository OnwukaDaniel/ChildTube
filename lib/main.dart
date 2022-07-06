import 'dart:collection';

import 'package:child_tube/screens/add.dart';
import 'package:child_tube/screens/channel.dart';
import 'package:child_tube/screens/home.dart';
import 'package:child_tube/screens/menu.dart';
import 'package:child_tube/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BuildContext _c1;
  late BuildContext _c2;
  late BuildContext _c3;
  late BuildContext _c4;
  late BuildContext _c5;

  final Queue<BuildContext> _queue = Queue();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    Widget app = MaterialApp(
      title: "Child Tube",
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
        "search": (BuildContext context) => Search(),
      },
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );

    return MaterialApp(
      title: "Child Tube",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _c1 = navigatorKey.currentContext!;
                  Navigator.of(_c1).pushNamed("home");
                  _queue.addLast(_c1);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/home.png"),
                ),
              ),
              IconButton(
                onPressed: () {
                  _c2 = navigatorKey.currentContext!;
                  Navigator.of(_c2).pushNamed("search");
                  _queue.addLast(_c2);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/search.png"),
                ),
              ),
              IconButton(
                onPressed: () {
                  _c3 = navigatorKey.currentContext!;
                  Navigator.of(_c3).pushNamed("add");
                  _queue.addLast(_c3);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/add.png"),
                ),
              ),
              IconButton(
                onPressed: () {
                  _c4 = navigatorKey.currentContext!;
                  Navigator.of(_c4).pushNamed("channel");
                  _queue.addLast(_c4);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/list.png"),
                ),
              ),
              IconButton(
                onPressed: () {
                  _c5 = navigatorKey.currentContext!;
                  Navigator.of(_c5).pushNamed("menu");
                  _queue.addLast(_c5);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/menu.png"),
                ),
              ),
            ],
          ),
        ),
        body: app,
      ),
    );
  }
}