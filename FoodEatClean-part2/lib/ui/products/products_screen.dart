import 'package:eatcleanproject/ui/home/app_bar_home.dart';
import 'package:eatcleanproject/ui/products/app_bar_products.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/category_list.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/products/products_grid.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBarProducts(),
        CategoryList(),
        Expanded(
            child: SingleChildScrollView(
          child: ProductsGrid(),
        ))
      ]),
    );
  }
}
