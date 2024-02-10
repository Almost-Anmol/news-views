import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class _ArticePageState extends StatefulWidget {
  const _ArticePageState({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<_ArticePageState> createState() => __ArticePageStateState();
}

class __ArticePageStateState extends State<_ArticePageState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebViewWidget(
        initialUrl: , controller: null,
      ),
    );
  }
}