import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InAppWebViewController cont;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Marine Life Tracker"),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            InAppWebView(
              initialUrlRequest:
                  URLRequest(url: Uri.parse('https://www.ghritracking.org/')),
              onWebViewCreated: (InAppWebViewController controller) {
                cont = controller;
              },
              onLoadStart: (controller, url) {},
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
            _progress < 1
                ? LinearProgressIndicator(
                    value: _progress,
                    color: Colors.teal,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
