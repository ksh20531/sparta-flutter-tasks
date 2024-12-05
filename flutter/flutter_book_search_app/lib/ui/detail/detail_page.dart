import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  Book book;

  DetailPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(book.link)),
        initialSettings: InAppWebViewSettings(userAgent: ''),
      ),
    );
  }
}
