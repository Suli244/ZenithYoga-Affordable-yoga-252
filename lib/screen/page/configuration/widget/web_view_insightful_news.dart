import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFFAffordableYoga extends StatefulWidget {
  final String url;
  final String title;

  const WebFFAffordableYoga({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebFFAffordableYoga> createState() => _WebFFAffordableYogaState();
}

class _WebFFAffordableYogaState extends State<WebFFAffordableYoga> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
