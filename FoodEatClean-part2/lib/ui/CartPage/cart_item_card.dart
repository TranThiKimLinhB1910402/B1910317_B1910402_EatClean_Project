import 'package:eatcleanproject/models/product.dart';
import 'package:eatcleanproject/ui/DetailsProduct/details_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/icon_and_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';
import 'package:eatcleanproject/ui/Products/Manager/product_manager.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  const CartItemCard(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              child: (Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 20),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(product.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 230,
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: product.title,
                            size: 15,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '50.000',
                            style: TextStyle(color: Colors.red),
                          )
                        ]),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
