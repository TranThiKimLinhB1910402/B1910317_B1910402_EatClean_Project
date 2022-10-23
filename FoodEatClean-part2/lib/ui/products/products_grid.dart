import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/widgets/category_list.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/products/products_list.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/icon_and_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2550,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return (Container(
            height: 630,
            child: Column(
              children: [
                // Text('abc'),
                Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Salad',
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
                ProductsList()
              ],
            ),
          ));
        },
      ),
    );
  }
}
