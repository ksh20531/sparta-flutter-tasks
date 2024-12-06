import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  String link;

  DetailPage(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(link)),
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true, // JavaScript 활성화
          domStorageEnabled: true, // DOM 스토리지 활성화
          mediaPlaybackRequiresUserGesture: false, // 미디어 재생 허용
          userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537'
              '.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        ),
      ),
    );
  }
}
