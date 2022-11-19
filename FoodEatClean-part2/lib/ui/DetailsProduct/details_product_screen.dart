import '/ui/CartPage/cart_manager.dart';
import '/ui/CartPage/cart_screen.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';

import '../widgets/appicon.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "/detail_product";
  final Product product;
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _n = 1;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.product.imageUrl))),
              )),
          Positioned(
              top: 70,
              left: 3,
              right: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: AppIcon(icon: Icons.arrow_back)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                      child: AppIcon(icon: Icons.shopping_cart_outlined)),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 330,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.title,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            )),
                        Text(widget.product.price.toString() + "00 VNĐ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          spacing: 3,
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: Colors.amber, size: 20);
                          }),
                        ),
                        SizedBox(width: 10),
                        Text('5', style: TextStyle(color: Colors.blueGrey)),
                        SizedBox(width: 10),
                        Text('1250', style: TextStyle(color: Colors.blueGrey)),
                        SizedBox(width: 10),
                        Text('Comments',
                            style: TextStyle(color: Colors.blueGrey))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.amber,
                            ),
                          ),
                          const TextSpan(
                              text: '\t\tBình thường',
                              style: TextStyle(color: Colors.black26)),
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                              text: '\t\t2.0 Km',
                              style: TextStyle(color: Colors.black26)),
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                              text: '\t\t30 phút',
                              style: TextStyle(color: Colors.black26)),
                        ]))
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mô tả',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18)),
                        SizedBox(
                          height: 18,
                        ),
                        Text(widget.product.description,
                            style: TextStyle(fontSize: 15)),
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 244, 244),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          minus();
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text('$_n',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17)),
                  ),
                  Container(
                    width: 35,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 244, 244),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          add();
                        },
                        child: Icon(Icons.add, color: Colors.black, size: 18)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[600]),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        final cart = context.read<CartManager>();
                        cart.addItem(widget.product, _n);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                      child: Text('THÊM VÀO GIỎ HÀNG',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
