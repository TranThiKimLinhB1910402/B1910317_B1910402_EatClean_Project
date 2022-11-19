import 'package:flutter/material.dart';

import '/ui/products/app_bar_products.dart';
import '/ui/widgets/category_list.dart';
import '/ui/products/products_grid.dart';



class ProductsPage extends StatefulWidget {
   static const routeName = "/admin_product";
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
