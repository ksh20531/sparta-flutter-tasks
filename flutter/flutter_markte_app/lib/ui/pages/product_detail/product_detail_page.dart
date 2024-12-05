import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/pages/product_detail/widgets/product_detail_actions.dart';
import 'package:flutter_markte_app/ui/pages/product_detail/widgets/product_detail_body.dart';
import 'package:flutter_markte_app/ui/pages/product_detail/widgets/product_detail_bottom_sheet.dart';
import 'package:flutter_markte_app/ui/pages/product_detail/widgets/product_detail_picture.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ProductDetailActions()],
      ),
      bottomSheet: ProductDetailBottomSheet(
        MediaQuery.of(context).padding.bottom,
      ),
      body: ListView(
        children: [
          ProductDetailPicture(),
          ProductDetailBody(),
        ],
      ),
    );
  }
}
