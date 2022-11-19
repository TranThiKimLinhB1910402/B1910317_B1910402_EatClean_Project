import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/typeproduct.dart';
import '/ui/screen.dart';
import '../../models/product.dart';

class ProductsGrid extends StatefulWidget {
  ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final typeProduct = TypeProductManager().items;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2550,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: typeProduct.length,
        itemBuilder: (context, index) {
          return (Container(
            height: 630,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: typeProduct[index].tenloai,
                            size: 18,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right,
                              color: AppColors.mainColor,
                            ),
                          )
                        ],
                      ),
                    )),
                ListTypeProduct(typeProduct[index])
              ],
            ),
          ));
        },
      ),
    );
  }
}

class ListTypeProduct extends StatefulWidget {
  final TypeProduct typeProduct;

  const ListTypeProduct(this.typeProduct, {super.key});

  @override
  State<ListTypeProduct> createState() => _ListTypeProductState();
}

class _ListTypeProductState extends State<ListTypeProduct> {
  // final products = ProductManager().items;
  late Future<void> _fetchProducts;
  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductManager>().fetchProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductManager();

    final products = context.select<ProductManager, List<Product>>(
        (productsManager) => productsManager.items);

    List<Product> listproducts = [];
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, add) {
          for (var e in products) {
            {
              if (e.type == widget.typeProduct.tenloai) {
                listproducts.add(e);
              }
            }
            ;
          }
          // print(listproducts[add]);
          if (listproducts.length != 0) {
            return CartProduct(listproducts[add]);
          } else {
            return Container();
          }
        });
  }
}
