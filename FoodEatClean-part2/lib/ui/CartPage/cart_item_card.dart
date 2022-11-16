import 'package:eatcleanproject/models/cart_item.dart';
import 'package:eatcleanproject/models/product.dart';
import 'package:eatcleanproject/ui/CartPage/cart_manager.dart';
import 'package:eatcleanproject/ui/DetailsProduct/details_product_screen.dart';
import 'package:eatcleanproject/ui/shared/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:eatcleanproject/ui/widgets/icon_and_text.dart';
import 'package:eatcleanproject/ui/widgets/small_text.dart';
import 'package:eatcleanproject/ui/Products/Manager/product_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatefulWidget {
  final String productId;
  final CartItem cartItem;
  const CartItemCard({
    required this.productId,
    required this.cartItem,
    super.key,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int _currCounter = 0;
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
    var _currCounter = widget.cartItem.quantity;
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
                  text: '${widget.cartItem.price}',
                  size: 15,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                buildEditButton(_currCounter)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditButton(counter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 26,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 239, 238, 238),
          ),
          child: IconButton(
            padding: new EdgeInsets.all(0.0),
            icon: FaIcon(
              FontAwesomeIcons.minus,
              size: 15,
            ),
            onPressed: () {},
            color: Color(0xFF756d54),
          ),
        ),
        SizedBox(width: 10),
        BigText(
          text: '${counter}',
          size: 16,
        ),
        SizedBox(width: 10),
        Container(
          height: 26,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 239, 238, 238),
          ),
          child: IconButton(
            padding: new EdgeInsets.all(0.0),
            icon: FaIcon(
              FontAwesomeIcons.plus,
              size: 15,
            ),
            onPressed: () {},
            color: Color(0xFF756d54),
          ),
        ),
      ],
    );
  }

  void _increment() {
    setState(() {
      _currCounter++;
    });
  }
}
