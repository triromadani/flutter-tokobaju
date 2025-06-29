import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String laravelUrl =
      'http://192.168.1.11:8000'; // Ganti sesuai IP lokal kamu

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TOKO BAJU")),
        body: WebViewWidgetWrapper(url: laravelUrl),
      ),
    );
  }
}

class WebViewWidgetWrapper extends StatefulWidget {
  final String url;

  WebViewWidgetWrapper({required this.url});

  @override
  _WebViewWidgetWrapperState createState() => _WebViewWidgetWrapperState();
}

class _WebViewWidgetWrapperState extends State<WebViewWidgetWrapper> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache()
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
