import 'package:eatcleanproject/models/cart_item.dart';
import 'package:eatcleanproject/models/product.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  final List<CartItem> product;
  final total;
  const OrderInfo(this.product, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Xác nhận thông tin đặt hàng')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Danh sách các sản phẩm',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              height: 300,
              child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(product[index].imageUrl),
                    title: Text('${product[index].title}'),
                    subtitle: Text('${product[index].quantity}'),
                  );
                },
              )),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 5.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Thông tin đặt hàng',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Họ tên",
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Số điện thoại",
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
