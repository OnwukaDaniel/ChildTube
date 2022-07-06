import 'package:carousel_slider/carousel_slider.dart';
import 'package:child_tube/webView/suggestion_web_view.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

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

  Widget searchBar = Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
    decoration: BoxDecoration(
      color: Colors.white54,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            initialValue: "Search Video",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 0.0,
          ),
          height: 50.0,
          child: const Icon(Icons.search),
        ),
      ],
    ),
  );
  Widget tubes = SizedBox(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            final List<String> _images = [
              "assets/ape.png",
              "assets/youtube.png",
              "assets/select.png",
              "assets/smile.png",
            ];
            return InkWell(
              onTap: () {
                if(index == 1){
                  String url = "https://www.youtubekids.com/";
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SuggestionWeb(webLink: url)));
                }
              },
                child: Image(image: AssetImage(_images[index])),
            );
          }));
  Widget recentViews = SizedBox(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            final List<String> _images = [
              "assets/nemo_recent.png",
              "assets/bird_recent.png",
            ];
            return InkWell(
              child: Image(image: AssetImage(_images[index])),
            );
          }));

  @override
  Widget build(BuildContext context) {
    Widget slider = CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
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
    return Scaffold(
      body: ListView(
        physics: const PageScrollPhysics(),
        children: [
          Stack(
            children: [
              slider,
              searchBar,
            ],
          ),
          tubes,
          const Text("Recently watched"),
          recentViews,
          InkWell(
            onTap: () {
              String url = "https://youtube.com/";
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SuggestionWeb(webLink: url)));
            },
            child: const Image(image: AssetImage("assets/youtube_kids.png")),
          ),
        ],
      ),
    );
  }
}

class SuggestionData {
  String link = "";
  String image = "";

  SuggestionData({required this.link, required this.image});
}
