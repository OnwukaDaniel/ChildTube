import 'package:child_tube/screens/add.dart';
import 'package:child_tube/screens/channel.dart';
import 'package:child_tube/screens/privacy_policy.dart';
import 'package:child_tube/screens/terms_of_use.dart';
import 'package:child_tube/screens/thanks.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);
  List<String> leadingImage = [
    "assets/add.png",
    "assets/list_red.png",
    "assets/world.png",
    "assets/favourite.png",
    "assets/user_red.png",
    "assets/privacy_policy.png",
    "assets/secure.png",
    "assets/heart.png",
  ];
  List<String> leadingName = [
    "Add Channel",
    "Memo List",
    "Language",
    "Review",
    "Contact Us",
    "Terms of Use",
    "Privacy Policy",
    "Thanks",
  ];

  Widget header = const MenuHeader();
  Widget divider = ElevatedDivider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          header,
          divider,
          ListView.builder(
            shrinkWrap: true,
            itemCount: leadingName.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  if(index == 0){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Channel()),
                    );
                  } else if(index == 1){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Add()),
                    );
                  } else if(index == 2){

                  } else if(index == 3){

                  } else if(index == 4){

                  } else if(index == 5){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Terms()),
                    );
                  } else if(index == 6){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                    );
                  } else if(index == 7){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Thanks()),
                    );
                  }
                  },
                child: MenuCard(image: leadingImage[index], name:
                leadingName[index]),
              );
            },
          )
        ],
      ),
    );
  }
}

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 45.0,
              backgroundImage: AssetImage("assets/person.png"),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("Select Tube -Reduce Time Waste"),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  String image = "";
  String name = "";
  MenuCard({Key? key, required this.image, required this.name}) : super(key: key);

  Widget divider = ElevatedDivider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image(image: AssetImage(image)),
          title: Text(name),
          trailing: const Image(image: AssetImage("assets/right_arrow.png")),
        ),
        divider,
      ],
    );
  }
}

class ElevatedDivider extends StatelessWidget {
  const ElevatedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      elevation: 6.0,
      child: Divider(height: 2, color: Colors.black),
    );
  }
}
