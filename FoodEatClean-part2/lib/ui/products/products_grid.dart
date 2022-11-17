import 'dart:math';

import 'package:eatcleanproject/models/typeproduct.dart';
import 'package:eatcleanproject/models/product.dart';
import 'package:eatcleanproject/ui/home/CardFood/cart_product.dart';
import 'package:eatcleanproject/ui/products/Manager/product_manager.dart';
import 'package:eatcleanproject/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/category_list.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/icon_and_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';

class ProductsGrid extends StatelessWidget {
  ProductsGrid({super.key});

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

class ListTypeProduct extends StatelessWidget {
  final TypeProduct typeProduct;
  
  ListTypeProduct(
    this.typeProduct,
    {super.key}
  ) ;

  final products = ProductManager().items;
  final listproduct = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, add) {
          products.forEach((e) => {
                if (e.type.compareTo(typeProduct.tenloai) == 0)
                  {listproduct.add(e)}
              });
          return CartProduct(listproduct[add]);
        });
  }
}