import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SuggestionWeb extends StatelessWidget {
  const SuggestionWeb({Key? key, required this.webLink}) : super(key: key);
  final webLink;

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;

    return MaterialApp(
      title: 'Child Tube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Youtube"),
        ),
        body: Center(
          child: WebView(
            initialUrl: webLink,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ),
    );
  }
}
