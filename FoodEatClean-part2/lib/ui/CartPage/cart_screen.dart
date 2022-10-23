import 'package:eatcleanproject/ui/CartPage/app_bar_cart.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Giỏ hàng"),
        actions: [Icon(Icons.arrow_back)],
      ),
      body: Column(children: []),
    );
  }
}
