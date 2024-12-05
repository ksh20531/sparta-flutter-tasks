import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/pages/product_write/product_write_page.dart';

class ProductDetailActions extends StatelessWidget {
  // TODO:: 자신의 글이 아니면 보여주지 않기
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('삭제');
          },
          child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(Icons.delete)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductWritePage();
            }));
          },
          child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(Icons.edit)),
        ),
      ],
    );
  }
}
