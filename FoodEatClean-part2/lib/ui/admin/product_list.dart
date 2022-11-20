import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '/ui/screen.dart';
import './admin_product_title.dart';
import '/ui/orders/app_bar_order.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final typeProduct = TypeProductManager().items;
  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductManager();
    return Scaffold(
        body: FutureBuilder(
      future: _refreshProducts(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: Column(
              children: [
                AppBarOrder(
                  title: 'Quản lý sản phẩm',
                  click: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProductScreen(null)));
                    },
                    icon: FaIcon(FontAwesomeIcons.plus,
                        size: 21, color: Color.fromARGB(255, 13, 76, 33)),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: buildUserProductListView(),
                  ),
                ))
              ],
            ));
      },
    ));
  }

  Widget buildUserProductListView() {
    return Consumer<ProductManager>(builder: (ctx, productsManager, child) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: productsManager.itemCount,
        itemBuilder: (ctx, i) => Column(
          children: [
            UserProductListTile(
              productsManager.items[i],
            ),
            const Divider(),
          ],
        ),
      );
    });
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}
