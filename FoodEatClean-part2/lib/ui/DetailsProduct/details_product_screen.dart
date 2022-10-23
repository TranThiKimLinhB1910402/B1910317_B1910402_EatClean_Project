import 'package:flutter/material.dart';
import '../../models/product.dart';

import '../widgets/appicon.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "/detail_product";
  // final Product product;
  const ProductDetailScreen(
      //  this.product,
      {
    super.key,
  });
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
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
                        image: AssetImage(
                            "assets/images/food/salad_rau_cu.jfif"))),
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
                        print('buy');
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
                        Text('Salad Rau củ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            )),
                        Text('65.000đ',
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
                        Text(
                            'Salad trộn dầu giấm là món ăn mà bạn có thể nghĩ ngay đến đầu tiên, vì dễ chế biến với các loại rau củ, nguyên liệu dễ tìm. Món ăn này có màu sắc bắt mắt, tươi mát, khi ăn các loại rau quả tươi ngon, giòn giòn, hòa quyện cùng nước sốt dầu giấm chua cay và ngọt hấp dẫn.',
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
                          print('remove');
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text('1',
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
                          print('add');
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
                        print('Buy');
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
