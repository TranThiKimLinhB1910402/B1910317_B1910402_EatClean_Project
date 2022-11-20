import 'dart:ui';

import '/models/cart_item.dart';
import '/ui/CartPage/cart_manager.dart';
import '/ui/DetailsProduct/details_product_screen.dart';
import '/ui/shared/dialog_utils.dart';
import 'package:flutter/material.dart';
import '/ui/widgets/big_text.dart';

import '/ui/widgets/small_text.dart';

import 'package:provider/provider.dart';

class CartItemCard extends StatefulWidget {
  final String productId;
  final CartItem cartItem;
  const CartItemCard({
    required this.productId,
    required this.cartItem,
    super.key,
  });

  int get itemCount {
    return cartItem.quantity;
  }

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: widget.productId);
      },
      child: Dismissible(
        key: ValueKey(widget.cartItem.id),
        direction: DismissDirection.endToStart,
        confirmDismiss: ((direction) {
          return showConfirmDialog(context,
              'Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng chứ?');
        }),
        onDismissed: (direction) {
          context.read<CartManager>().removeItem(widget.productId);
        },
        child: Column(
          children: [
            _buildItemCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard() {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 20),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.cartItem.imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 120,
            width: 230,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
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
                  text: widget.cartItem.title,
                  size: 15,
                ),
                SizedBox(
                  height: 3,
                ),
                SmallText(
                  text: '${widget.cartItem.price}' + '00 VNĐ',
                  size: 15,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                  width: 100,
                  child: Row(children: [
                    Text(
                      'Số lượng:',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 5),
                    Text('${widget.cartItem.quantity}',
                        style: TextStyle(fontSize: 17, color: Colors.red))
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
