import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Channel extends StatefulWidget {
  const Channel({Key? key}) : super(key: key);

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  late List channel = [];
  TextEditingController memoController = TextEditingController();
  late final List<String> tabKeyList;
  bool searchable = true;
  bool autofocusSearch = false;

  FocusNode inputNode = FocusNode();
  void openKeyboard(){
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  void initState() {
    channel.addAll([
      ChannelData(
          id: 0,
          name: "Example Channel BD1",
          subName: "Video Channel for Kid",
          image: "assets/image6.png"),
      ChannelData(
          id: 1,
          name: "Example Channel BD2",
          subName: "Video Channel for Kid",
          image: "assets/image7.png"),
      ChannelData(
          id: 2,
          name: "Example Channel BD3",
          subName: "Video Channel for Kid",
          image: "assets/image8.png"),
      ChannelData(
          id: 3,
          name: "Example Channel BD4",
          subName: "Video Channel for Kid",
          image: "assets/image9.png"),
      ChannelData(
          id: 4,
          name: "Example Channel BD5",
          subName: "Video Channel for Kid",
          image: "assets/image10.png"),
    ]);
    memoController = TextEditingController();
    memoController.text = "Enter Channel ID";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: SizedBox(
          width: 50.0,
          child: IconButton(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(16.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: TextFormField(
            focusNode: inputNode,
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
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(12.0),
            width: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                String input = memoController.text;
                if (input == "") return;
                setState(() {
                  if (channel.length < 5) {
                    searchable = false;
                  } else {
                    searchable = true;
                  }
                  channel.add(ChannelData(name: input));
                });
              },
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: channel.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.grey[100],
                  elevation: 4.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 10.0,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          child: CircleAvatar(
                            radius: 42.0,
                            backgroundImage: AssetImage(channel[index].image),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          alignment: Alignment.centerLeft,
                          height: 50,
                          child: Text(channel[index].name),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (channel.length < 5) {
                                searchable = false;
                              } else {
                                searchable = true;
                              }
                              channel.removeAt(index);
                            });
                          },
                          child: const Image(
                            image: AssetImage("assets/trash.png"),
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          if (searchable)
            Center(
              child: Container(
                padding: const EdgeInsets.all(6.0),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(12.0),
                width: 170.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      openKeyboard();
                    });
                  },
                  child: const Text(
                    "Search Channel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ChannelData {
  int id = 0;
  String name = "";
  String image = "";
  String subName = "";

  ChannelData(
      {this.id = 0,
      required this.name,
      this.image = "assets/image8.png",
      this.subName = ""});
}
