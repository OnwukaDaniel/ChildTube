import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:child_tube/webView/suggestion_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Add extends StatefulWidget {
  const Add({Key? key }) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  late final List<String> tabKeyList;
  late List memo = List.generate(0, (index) => MemoData(id: 0, memo: "memo"));
  TextEditingController memoController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> memoJson;

  final List<SuggestionData> dataList = [
    SuggestionData(
        link: "https://minerva.in.net/child-tube/carousel-news1/",
        image: "https://minerva.in"
            ".net/child-tube/wp-content/uploads/2022/07/carousel-news1.png"),
    SuggestionData(
        link: "https://minerva.in.net/child-tube/carousel-news2/",
        image: "https://minerva.in"
            ".net/child-tube/wp-content/uploads/2022/07/carousel-news2.png"),
    SuggestionData(
        link: "https://minerva.in.net/child-tube/carousel-news3/",
        image: "https://minerva.in"
            ".net/child-tube/wp-content/uploads/2022/07/carousel-news3.png"),
    SuggestionData(
        link: "https://minerva.in.net/child-tube/carousel-news4/",
        image: "https://minerva.in"
            ".net/child-tube/wp-content/uploads/2022/07/carousel-news4.png"),
    SuggestionData(
        link: "https://minerva.in.net/child-tube/carousel-news5/",
        image: "https://minerva.in"
            ".net/child-tube/wp-content/uploads/2022/07/carousel-news5.png"),
    SuggestionData(
        link: "https://minerva.in.net/child-tube/carousel-news6/",
        image: "https://minerva.in"
            ".net/child-tube/wp-content/uploads/2022/07/carousel-news6.png"),
  ];

  @override
  void initState() {
    memoJson = _prefs
        .then((SharedPreferences prefs) => prefs.getString("memo list") ?? "");
    memoController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget slider = CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        height: 300.0,
      ),
      items: dataList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SuggestionWeb(webLink: i.link)));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(image: NetworkImage(i.image)),
              ),
            );
          },
        );
      }).toList(),
    );

    return ListView(
      physics:
          const PageScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.vertical,
      children: [
        Stack(
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
              child: slider,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            String inputMemo = memoController.text;
            if (inputMemo == "") return;
            setState(() {
              memo.add(inputMemo);
            });
          },
          child: Card(
            color: Colors.green,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            elevation: 4.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 150.0,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    controller: memoController,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: memo.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.grey[100],
                elevation: 4.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      child: Text(memo[index]),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          memo.removeAt(index);
                        });
                      },
                      child: const Image(
                        image: AssetImage("assets/trash.png"),
                        height: 32.0,
                        width: 32.0,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Future<void> getMemo() async {
    final SharedPreferences prefs = await _prefs;
    String? memoJson = prefs.getString("memo list");
    List<MemoData> data = jsonDecode(memoJson!);
    setState(() {
      memo = data;
    });
  }

  void addMemo(String memoString) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      memo.add(MemoData(id: memo.length, memo: memoString));
      prefs.setString("memo list", memo.toString());
      print("Here ************************* ${memo.length}");
    });
  }
}

class CardMemo extends StatefulWidget {
  final String text;
  final int id;
  final int index;
  final List<MemoData> memo;

  static _CardMemoState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CardMemoState>();

  CardMemo(this.text, this.id, this.memo, this.index) : super();

  @override
  State<CardMemo> createState() => _CardMemoState(text, id, memo, index);
}

class _CardMemoState extends State<CardMemo> {
  final String text;
  final int id;
  final int index;
  final List<MemoData> memo;

  _CardMemoState(this.text, this.id, this.memo, this.index) : super();

  @override
  Widget build(BuildContext context) {
    CardMemo.of(context)!.index;
    return Card(
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width - 100,
            height: 50,
            child: Text(text),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                memo;
              });
            },
            child: const Image(
              image: AssetImage("assets/trash.png"),
              height: 32.0,
              width: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}

class MemoData {
  int id = 0;
  String memo = "";

  MemoData({required this.id, required this.memo});

  MemoData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    memo = json["memo"];
  }
}
