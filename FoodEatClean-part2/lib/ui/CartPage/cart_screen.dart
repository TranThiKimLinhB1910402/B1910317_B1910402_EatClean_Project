import 'package:eatcleanproject/ui/CartPage/app_bar_cart.dart';
import 'package:eatcleanproject/ui/CartPage/cart_item_card.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/products/Manager/product_manager.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final products = ProductManager().items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBarCart(),
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            height: 1000,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) => CartItemCard(products[index])),
          ),
        )),
        Container(
          margin: EdgeInsets.only(left: 250),
          child: ElevatedButton(
              onLongPress: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.mainColor),
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      top: 10, bottom: 10, right: 20, left: 20)),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),
              onPressed: () {},
              child: const Text('Đặt hàng')),
        ),
      ]),
    );
  }
}
