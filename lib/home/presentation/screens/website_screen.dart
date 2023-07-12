import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class WebsiteScreen extends StatefulWidget {
  final String url;
  const WebsiteScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    var uri = Uri.parse(widget.url);
    return Scaffold(
      appBar: AppBar(title: Text(uri.host)),
      body: WebViewWidget(controller: controller),
    );
  }
}
