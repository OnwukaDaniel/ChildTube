import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  const Thanks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thanks",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading:
          IconButton(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(16.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Thanks"),
        ),
        body: ListView(
          physics:
          const PageScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Google.inc"),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Mr. Prateek "),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Flutter"),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Youtube"),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("저는 한국어를 한국에서 배웠어요 저는 한국어를배웠어요 저는 한국배웠배웠어요 저는 한국"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Mr. Takuma"),
            ),
          ],
        ),
      ),
    );
  }
}